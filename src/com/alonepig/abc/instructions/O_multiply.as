package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_multiply extends BaseInstruction
	{
		public function O_multiply(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0xa2;
			this.opcodeName = "multiply";
		}
	}
}