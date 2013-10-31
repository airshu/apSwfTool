package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_multiply_i extends BaseInstruction
	{
		public function O_multiply_i(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0xc7;
			this.opcodeName = "multiply_i";
		}
	}
}