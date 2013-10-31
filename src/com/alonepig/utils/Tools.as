package com.alonepig.utils
{
	
	import flash.utils.ByteArray;
	
	public class Tools
	{
		/**
		 * 用做中转，很多地方的toString或其他方法使用
		 * 在访问AbcFile时候重设
		 */		
//		public static var abcFile:AbcFile;
		public function Tools()
		{
		}
		
		/**
		 * 读取一定长度的位 
		 * 无符号的
		 * 
		 * @param bytes 二进制序列
		 * @param bitStartPosition 开始读取的位置，从0开始算
		 * @param bitLength     读取长度
		 * @return 无符号数字
		 * 
		 */ 
		public static function readUBits(bytes:ByteArray, bitStartPosition:int, bitLength:int):uint{
			var bitBuffer:int;
			var bitCursor:int;
			
			var remainLength:int;
			var result:uint=0;
			
			bitCursor= bitStartPosition % 8;
			bytes.position = bitStartPosition / 8;
			
			// 开始位的位置为0，则直接读取一个字节
			if (bitCursor == 0)
			{
				bitBuffer = bytes.readUnsignedByte();
				bitCursor = 8;
			}
			else
			{
				// 如果不为0，则算出开始位到下一个position的bit值
				bitBuffer = bytes.readUnsignedByte();
				bitBuffer = bitBuffer & (0xFF >> bitCursor);
				bitCursor = 8 - bitCursor;
			}
			
			while(bytes.bytesAvailable > 0){
				remainLength = bitLength - bitCursor;
				if (remainLength > 0)
				{
					result = result | (bitBuffer << remainLength);
					bitLength -= bitCursor;
					bitBuffer = bytes.readUnsignedByte();
					bitCursor = 8;
				}
				else
				{
					result = result | (bitBuffer >> -remainLength);
					return result;
				}
			}
			return 0;
		}
		
		public static function wirteBits(bytes:ByteArray, bitStartPosition:int, bitLength:int, v:int):void{
			var bitBuffer:int;//bytes中取出的值
			var bitCursor:int;//bytes的填入起始位
			var v_startIndex:int = 0;//取v的v_len位的起始，从左到右递增
			var v_len:int = 0;//对v取多长
			var v_value:int = 0;//从v中取的值
			
			bitCursor = bitStartPosition % 8;
			bytes.position = bitStartPosition / 8;
			
			while(bitLength > v_startIndex){
				v_len = 8 - bitCursor;
				v_len = v_len > (bitLength - v_startIndex) ? (bitLength - v_startIndex) : v_len;
				
				bitBuffer = bytes.readUnsignedByte();
				bitBuffer &= getAndPar(bitCursor, 8 - bitCursor);
				
				v_value = v & getAndPar(v_len, bitLength - v_startIndex - v_len);
				v -= v_value;
				
				v_value >>= (bitLength - v_startIndex - v_len);
				v_value <<= (8 - (bitCursor + v_len));
				
				bytes[bytes.position - 1] = bitBuffer | v_value;
				
				bitCursor = 0;
				v_startIndex += v_len;
			}
		}
		/**
		 * 获得与参数
		 * 比如getAndPar(5, 3)则返回二进制的（11111000）
		 * 
		 */		
		private static function getAndPar(num:uint, leftCount:uint):uint{
			var v:uint = Math.pow(2, num) - 1;
			return v << leftCount;
		}
		/**
		 * 读取一定长度的位 
		 * 有符号的
		 * 
		 * @param bytes 二进制序列
		 * @param bitStartPosition 开始读取的位置，从0开始算
		 * @param bitLength 读取长度
		 * @return 有符号数字
		 * 
		 */     
		public static function readSBits(bytes:ByteArray, bitStartPosition:int, bitLength:int):int{
			
			var result:int = readUBits(bytes, bitStartPosition, bitLength);
			
			var offset:int = (32 - bitLength);
			// 补齐符号位
			result = ((result << offset) >> offset);
			
			return result;
		}
		public static function readS24(bt:ByteArray):int{
//			var v1:int = bt.readByte();
//			var v2:int = bt.readByte();
//			var v3:int = bt.readByte();
			var v1:int = bt.readUnsignedByte();
			var v2:int = bt.readUnsignedByte();
			var v3:int = bt.readUnsignedByte();
			v2 <<= 8;
			v3 <<= 16;
			return v1 | v2 | v3;
		}
		public static function writeS24(bt:ByteArray, v:int):void{
			bt.writeByte(v & 0xff);
			bt.writeByte(v >> 8 & 0xff);
			bt.writeByte(v >> 16);
		}
		
		public static function readFBits(bytes:ByteArray, bitStartPosition:int, bitLength:int):Number{
//			var result:int = readUBits(bytes, bitStartPosition, bitLength);
//			var n1:int = result & 0xFFFF0000;
//			var offset:uint = 32 - bitLength + 16;
//			offset = Math.min(offset, 32);
//			// 补齐符号位
//			n1 = ((n1 << offset) >> offset);
//			var n2:uint = result & 0x0000FFFF;
//			
//			result = parseInt(n1 + "." + n2);
			
			var result:int = readUBits(bytes, bitStartPosition, bitLength);
			var shift:int = 32 - bitLength;
			result = (result << shift) >> shift;
			
			return (result)/65536;
		}
		
//		public static function getABCXMLList(tags:Array):XMLList{
//			var xmlStr:String = "<node label='DoABCs'>";
//			var i:int = 0;
//			var count:int = tags.length;
//			var showCount:int = 20;
//			for(i = 0; i < count; i++){
//				var tag:Tag = tags[i];
//				if(showCount > 0 && tag.tagType == TagTypes.TAG_DOABC){
//					xmlStr += "<node label='DoABC_" + i + "' txt='" + tag.toXmlString() + "'>";
//					xmlStr += tag.getXmlStr()
//					xmlStr += "</node>";
//					showCount--;
//				}
//			}
//			xmlStr += "</node>";
//			return new XMLList(xmlStr);
//		}
//		public static function getABCList(tags:Array):Array{
//			var arr:Array = new Array();
//			var i:int = 0;
//			var count:int = tags.length;
//			for(i = 0; i < count; i++){
//				var tag:Tag = tags[i];
//				if(tag.tagType == TagTypes.TAG_DOABC){
//					var ob:Object = {};
//					ob.label = i + "_" + (tag as DoABCTag).Flags + "_" + (tag as DoABCTag).Name;
//					ob.data = i;
//					arr.push(ob);
//				}
//			}
//			return arr;
//		}
//		public static function toArrString(arr:Array):String{
//			var str:String = "";
//			var i:int = 0;
//			var count:int = arr.length;
//			for(i = 0; i < count; i++){
//				str += i + "：\t" + arr[i] + "\n";
//			}
//			return str;
//		}
//		public static function toArrString2(arr:Array, exceptKeyWords:Boolean = true):String{
//			var str:String = "";
//			var i:int = 0;
//			var count:int = arr.length;
//			var addCount:int = 0;
//			for(i = 0; i < count; i++){
//				if(exceptKeyWords && KeyWords.isKeyWords(arr[i])){
//					continue;
//				}
//				addCount++;
//				str += arr[i] + "\n";
//			}
//			str += addCount + "\n";
//			return str;
//		}
		public static function toArrString3(arr:Array):String{
			var str:String = "";
			var i:int = 0;
			var count:int = arr.length;
			for(i = 0; i < count; i++){
				str += arr[i];
			}
			return str;
		}
		public static function getRandom(min:int, max:int):int {
			return int(Math.random() * (max - min) + min)
		}

		
		
		
		
		//  =========================================  //
		
		
		
		public static const FLOAT16_EXPONENT_BASE:Number = 15;
		/**
		 * 读取FLOAT16类型的数据 
		 * @param bt
		 * @return 
		 * 
		 */	
		public static function readFloat16(bt:ByteArray):Number
		{
			var word:uint = bt.readUnsignedShort();
			var sign:int = ((word & 0x8000) != 0) ? -1 : 1;
			var exponent:uint = (word >> 10) & 0x1f;
			var significand:uint = word & 0x3ff;
			if (exponent == 0) {
				if (significand == 0) {
					return 0;
				} else {
					// subnormal number
					return sign * Math.pow(2, 1 - FLOAT16_EXPONENT_BASE) * (significand / 1024);
				}
			}
			if (exponent == 31) { 
				if (significand == 0) {
					return (sign < 0) ? Number.NEGATIVE_INFINITY : Number.POSITIVE_INFINITY;
				} else {
					return Number.NaN;
				}
			}
			// normal number
			return sign * Math.pow(2, exponent - FLOAT16_EXPONENT_BASE) * (1 + significand / 1024);
		}
		
//		public static function readUB(bt:ByteArray, bits:uint):uint 
//		{
//			return readBits(bt, bits);
//		}
		
		public static function readSB(bt:ByteArray, bits:uint):int 
		{
			var shift:uint = 32 - bits;
			return int(readBits(bt, bits) << shift) >> shift;
		}
		
		protected static var bitsPending:uint = 0;
		public static function readBits(bt:ByteArray, bits:uint, bitBuffer:uint = 0):uint {
			if (bits == 0) { return bitBuffer; }
			var partial:uint;
			var bitsConsumed:uint;
			if (bitsPending > 0) {
				var byte:uint = bt[bt.position - 1] & (0xff >> (8 - bitsPending));
				bitsConsumed = Math.min(bitsPending, bits);
				bitsPending -= bitsConsumed;
				partial = byte >> bitsPending;
			} else {
				bitsConsumed = Math.min(8, bits);
				bitsPending = 8 - bitsConsumed;
				partial = bt.readUnsignedByte() >> bitsPending;
			}
			bits -= bitsConsumed;
			bitBuffer = (bitBuffer << bitsConsumed) | partial;
			return (bits > 0) ? readBits(bt, bits, bitBuffer) : bitBuffer;
		}
		
	}
}