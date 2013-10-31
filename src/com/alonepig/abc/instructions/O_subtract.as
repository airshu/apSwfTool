package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_subtract extends BaseInstruction
	{
		public function O_subtract(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0xa1;
			this.opcodeName = "subtract";
		}
	}
}