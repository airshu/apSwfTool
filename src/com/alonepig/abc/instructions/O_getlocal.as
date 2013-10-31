package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 获取局部变量
	 */	
	public class O_getlocal extends BaseInstruction
	{
		public var index:int = 0;
		
		public function O_getlocal(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x62;
			this.opcodeName = "getlocal";
		}
		
//		override public function read(bt:ABCData):void{
//			this.index = EncodedU32.read(bt);
//		}
//		override public function write(bt:ByteArray):void{
//			super.write(bt);
//			EncodedU32.write(bt, this.index);
//		}
	}
}