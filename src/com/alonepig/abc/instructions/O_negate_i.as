package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_negate_i extends BaseInstruction
	{
		public function O_negate_i(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0xc4;
			this.opcodeName = "negate_i";
		}
	}
}