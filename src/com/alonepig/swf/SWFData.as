package com.alonepig.swf
{
	import com.alonepig.swf.records.Rect;
	import com.alonepig.swf.records.actions.ActionRecord;
	import com.alonepig.swf.records.actions.ActionRecordFactory;
	
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	
	/**
	 * 保存swf的字节数组 
	 * 读取不同类型的数据
	 */	
	public class SWFData extends ByteArray
	{
		public function SWFData()
		{
			endian = Endian.LITTLE_ENDIAN;
		}
		
		protected var bitsPending:uint = 0;
		
		public function readBits(bits:uint, bitBuffer:uint = 0):uint 
		{
			if (bits == 0) 
			{
				return bitBuffer;
			}
			var partial:uint;
			var bitsConsumed:uint;
			if (bitsPending > 0) 
			{
				var byte:uint = this[position - 1] & (0xff >> (8 - bitsPending));
				bitsConsumed = Math.min(bitsPending, bits);
				bitsPending -= bitsConsumed;
				partial = byte >> bitsPending;
			}
			else 
			{
				bitsConsumed = Math.min(8, bits);
				bitsPending = 8 - bitsConsumed;
				partial = readUnsignedByte() >> bitsPending;
			}
			bits -= bitsConsumed;
			bitBuffer = (bitBuffer << bitsConsumed) | partial;
			return (bits > 0) ? readBits(bits, bitBuffer) : bitBuffer;
		}
		
		public function writeBits(bits:uint, value:uint):void {
			if (bits == 0) { return; }
			value &= (0xffffffff >>> (32 - bits));
			var bitsConsumed:uint;
			if (bitsPending > 0) {
				if (bitsPending > bits) {
					this[position - 1] |= value << (bitsPending - bits);
					bitsConsumed = bits;
					bitsPending -= bits;
				} else if (bitsPending == bits) {
					this[position - 1] |= value;
					bitsConsumed = bits;
					bitsPending = 0;
				} else {
					this[position - 1] |= value >> (bits - bitsPending);
					bitsConsumed = bitsPending;
					bitsPending = 0;
				}
			} else {
				bitsConsumed = Math.min(8, bits);
				bitsPending = 8 - bitsConsumed;
				writeByte((value >> (bits - bitsConsumed)) << bitsPending);
			}
			bits -= bitsConsumed;
			if (bits > 0) {
				writeBits(bits, value);
			}
		}
		
		public function resetBitsPending():void {
			bitsPending = 0;
		}
		
		public function readSI8():int {
			resetBitsPending();
			return readByte();
		}
		
		public function writeSI8(value:int):void {
			resetBitsPending();
			writeByte(value);
		}
		
		public function readSI16():int {
			resetBitsPending();
			return readShort();
		}
		
		public function writeSI16(value:int):void {
			resetBitsPending();
			writeShort(value);
		}
		
		public function readSI32():int {
			resetBitsPending();
			return readInt();
		}
		
		public function writeSI32(value:int):void {
			resetBitsPending();
			writeInt(value);
		}
		
		public function readUI8():uint {
			resetBitsPending();
			return readUnsignedByte();
		}
		
		public function writeUI8(value:uint):void {
			resetBitsPending();
			writeByte(value);
		}
		
		public function readUI16():uint {
			resetBitsPending();
			return readUnsignedShort();
		}
		
		public function writeUI16(value:uint):void {
			resetBitsPending();
			writeShort(value);
		}
		
		public function readUI24():uint {
			resetBitsPending();
			var loWord:uint = readUnsignedShort();
			var hiByte:uint = readUnsignedByte();
			return (hiByte << 16) | loWord;
		}
		
		public function writeUI24(value:uint):void {
			resetBitsPending();
			writeShort(value & 0xffff);
			writeByte(value >> 16);
		}
		
		public function readUI32():uint {
			resetBitsPending();
			return readUnsignedInt();
		}
		
		public function writeUI32(value:uint):void {
			resetBitsPending();
			writeUnsignedInt(value);
		}
		
		/////////////////////////////////////////////////////////
		// Fixed-point numbers  为何是这样读取？
		/////////////////////////////////////////////////////////
		
		public function readFIXED():Number {
			resetBitsPending();
			return readInt() / 65536;
		}
		
		public function writeFIXED(value:Number):void {
			resetBitsPending();
			writeInt(int(value * 65536));
		}
		
		public function readFIXED8():Number {
			resetBitsPending();
			return readShort() / 256;
		}
		
		public function writeFIXED8(value:Number):void {
			resetBitsPending();
			writeShort(int(value * 256));
		}
		
		/////////////////////////////////////////////////////////
		// Floating-point numbers
		/////////////////////////////////////////////////////////
		
		public function readFLOAT():Number {
			resetBitsPending();
			return readFloat();
		}
		
		public function writeFLOAT(value:Number):void {
			resetBitsPending();
			writeFloat(value);
		}
		
		public function readDOUBLE():Number {
			resetBitsPending();
			return readDouble();
		}
		
		public function writeDOUBLE(value:Number):void {
			resetBitsPending();
			writeDouble(value);
		}
		
		/////////////////////////////////////////////////////////
		// Encoded integer
		/////////////////////////////////////////////////////////
		
		public function readEncodedU32():uint {
			resetBitsPending();
			var result:uint = readUnsignedByte();
			if (result & 0x80) {
				result = (result & 0x7f) | (readUnsignedByte() << 7);
				if (result & 0x4000) {
					result = (result & 0x3fff) | (readUnsignedByte() << 14);
					if (result & 0x200000) {
						result = (result & 0x1fffff) | (readUnsignedByte() << 21);
						if (result & 0x10000000) {
							result = (result & 0xfffffff) | (readUnsignedByte() << 28);
						}
					}
				}
			}
			return result;
		}
		
		public function writeEncodedU32(value:uint):void {
			for (;;) {
				var v:uint = value & 0x7f;
				if ((value >>= 7) == 0) {
					writeUI8(v);
					break;
				}
				writeUI8(v | 0x80);
			}
		}
		
		/////////////////////////////////////////////////////////
		// Bit values
		/////////////////////////////////////////////////////////
		
		public function readUB(bits:uint):uint {
			return readBits(bits);
		}
		
		public function writeUB(bits:uint, value:uint):void {
			writeBits(bits, value);
		}
		
		public function readSB(bits:uint):int {
			var shift:uint = 32 - bits;
			return int(readBits(bits) << shift) >> shift;
		}
		
		public function writeSB(bits:uint, value:int):void {
			writeBits(bits, value);
		}
		
		public function readFB(bits:uint):Number {
			return Number(readSB(bits)) / 65536;
		}
		
		public function writeFB(bits:uint, value:Number):void {
			writeSB(bits, value * 65536);
		}
		
		/////////////////////////////////////////////////////////
		// String 该类型都是空字符结尾
		/////////////////////////////////////////////////////////
		
		public function readString():String {
			var index:uint = position;
			while (this[index++] && index<length) 
			{}
			resetBitsPending();
			return readUTFBytes(index - position);
		}
		
		public function writeString(value:String):void {
			if (value && value.length > 0) {
				writeUTFBytes(value);
			}
			writeByte(0);
		}
		
		public function skipBytes(length:uint):void {
			position += length;
		}
		
		
		
		
		public function writeRECT(rect:Rect):void
		{
			rect.publish(this);
		}
		
		public function calculateMaxBits(signed:Boolean, values:Array):uint {
			var b:uint = 0;
			var vmax:int = int.MIN_VALUE;
			if(!signed) {
				for each(var usvalue:uint in values) {
					b |= usvalue;
				}
			} else {
				for each(var svalue:int in values) {
					if(svalue >= 0) {
						b |= svalue;
					} else {
						b |= ~svalue << 1;
					}
					if(vmax < svalue) {
						vmax = svalue;
					}
				}
			}
			var bits:uint = 0;
			if(b > 0) {
				bits = b.toString(2).length;
				if(signed && vmax > 0 && vmax.toString(2).length >= bits) {
					bits++;
				}
			}
			return bits;
		}
		
		
		
		public function swfCompress():void {
			var pos:uint = position;
			var ba:ByteArray = new ByteArray();
			readBytes(ba);
			ba.position = 0;
			ba.compress();
			length = position = pos;
			writeBytes(ba);
		}
		
		/**
		 * @param type
		 * @param length
		 * @param foceLongHeader
		 */		
		public function writeTagHeader(type:uint, length:uint, forceLongHeader:Boolean = false):void
		{
			if (length < 0x3f && !forceLongHeader)
			{
				writeUI16((type << 6) | length);
			} 
			else
			{
				// 长型
				writeUI16((type << 6) | 0x3f);
				// The SWF10 spec sez that this is a signed int.
				// Shouldn't it be an unsigned int?
				writeSI32(length);
			}
		}
		
		
		
		
		
		
		
		
		
		/**
		 * 读取ActionRecord 类型 
		 */		
		public function readActionRecord():ActionRecord
		{
			var actionRecord:ActionRecord;
			var actionCode:uint = readUI8();
			if(actionCode != 0)
			{
				var actionLength:uint = actionCode >= 0x80 ? readUI16() : 0;
				actionRecord = ActionRecordFactory.create(actionCode, actionLength);
				actionRecord.read(this);
			}
			return actionRecord;
		}
		
		
	}
}