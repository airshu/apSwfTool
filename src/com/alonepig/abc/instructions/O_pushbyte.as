package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	import flash.utils.ByteArray;
	
	
	/**
	 * 
	 * 添加一个无符号字节
	 * 
	 */	
	public class O_pushbyte extends BaseInstruction
	{
		public var byte_value:int = 0;
		
		public function O_pushbyte(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x24;
			this.opcodeName = "pushbyte";
		}
		
		override public function read(bt:ABCData):void
		{
			this.byte_value = bt.readUnsignedByte();
		}
		
//		override public function write(bt:ByteArray):void{
//			super.write(bt);
//			bt.writeByte(byte_value);
//		}
//		override public function toString():String{
//			return super.toString() + byte_value;
//		}
	}
}