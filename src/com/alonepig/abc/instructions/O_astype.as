package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	import com.alonepig.swf.data.EncodedU32;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_astype extends BaseInstruction
	{
		public var index:int;
		public function O_astype(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x86;
			this.opcodeName = "astype";
		}
		
		override public function read(bt:ABCData):void{
			super.read(bt);
			this.index = EncodedU32.read(bt);
		}
		
	}
}