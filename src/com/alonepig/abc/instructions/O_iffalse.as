package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 是否是false
	 * 
	 */	
	public class O_iffalse extends BaseInstruction
	{
		public var offset:int = 0;
		
		public function O_iffalse(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x12;
			this.opcodeName = "iffalse";
		}
		
		override public function read(bt:ABCData):void
		{
			offset = bt.readS24();
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