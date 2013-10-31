package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_lessthan extends BaseInstruction
	{
		public function O_lessthan(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0xad;
			this.opcodeName = "lessthan";
		}
	}
}