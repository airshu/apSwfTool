package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_subtract_i extends BaseInstruction
	{
		public function O_subtract_i(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0xc6;
			this.opcodeName = "subtract_i";
		}
	}
}