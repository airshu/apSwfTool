package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 */	
	public class O_inclocal_i extends BaseInstruction
	{
		public var index:int = 0;
		public function O_inclocal_i(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0xc2;
			this.opcodeName = "inclocal_i";
		}
		
		override public function read(bt:ABCData):void
		{
			this.index = bt.readU32();
		}
//		override public function write(bt:ByteArray):void{
//			super.write(bt);
//			EncodedU32.write(bt, this.index);
//		}
//		override public function toString():String{
//			return super.toString() + index;
//		}
	}
}