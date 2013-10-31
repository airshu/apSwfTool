package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	import com.alonepig.swf.data.EncodedU32;
	
	import flash.utils.ByteArray;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_debug extends BaseInstruction
	{
		public var debug_type:int;
		public var index:int;
		public var reg:int;
		public var extra:int;
		public function O_debug(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0xef;
			this.opcodeName = "debug";
		}
		override public function read(bt:ABCData):void{
			this.debug_type = bt.readUnsignedByte();
			this.index = EncodedU32.read(bt);
			this.reg = bt.readUnsignedByte();
			this.extra = EncodedU32.read(bt);
		}
//		override public function write(bt:ByteArray):void{
//			super.write(bt);
//			bt.writeByte(this.debug_type);
//			EncodedU32.write(bt, this.index);
//			bt.writeByte(this.reg);
//			EncodedU32.write(bt, this.extra);
//		}
//		override public function toString():String{
//			return super.toString() + debug_type + "," + index + "," + reg + "," + extra;
//		}
	}
}