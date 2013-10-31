package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_ifstricteq extends BaseInstruction
	{
		public var offset:int = 0;
		public function O_ifstricteq(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x19;
			this.opcodeName = "ifstricteq";
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