package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_throw extends BaseInstruction
	{
		public function O_throw(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x03;
			this.opcodeName = "throw";
		}
	}
}