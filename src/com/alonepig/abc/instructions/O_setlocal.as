package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	import com.alonepig.swf.data.EncodedU32;
	
	
	/**
	 * 设置局部变量 
	 */
	public class O_setlocal extends BaseInstruction
	{
		public var index:int = 0;
		
		public function O_setlocal(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x63;
			this.opcodeName = "setlocal";
		}
		
		override public function read(bt:ABCData):void
		{
			this.index = EncodedU32.read(bt);
		}
		
//		override public function write(bt:ByteArray):void{
//			super.write(bt);
//			EncodedU32.write(bt, this.index);
//		}
	}
}