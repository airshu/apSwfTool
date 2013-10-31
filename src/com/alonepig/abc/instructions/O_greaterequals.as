package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_greaterequals extends BaseInstruction
	{
		public function O_greaterequals(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0xaf;
			this.opcodeName = "greaterequals";
		}
	}
}