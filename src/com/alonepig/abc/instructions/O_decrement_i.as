package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_decrement_i extends BaseInstruction
	{
		public function O_decrement_i(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0xc1;
			this.opcodeName = "decrement_i";
		}
	}
}