package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 跳转到offset执行
	 * 
	 */	
	public class O_jump extends BaseInstruction
	{
		public var offset:int = 0;
		
		public function O_jump(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x10;
			this.opcodeName = "jump";
		}
		
		override public function read(bt:ABCData):void
		{
			offset = bt.readS24();
//			Tools.readS24(bt);
		}
		
//		override public function write(bt:ByteArray):void{
//			super.write(bt);
//			Tools.writeS24(bt, offset);
//		}
//		override public function toString():String{
//			return super.toString() + "<font color='#0033FF'>" + offset + "</font>";
//		}
	}
}