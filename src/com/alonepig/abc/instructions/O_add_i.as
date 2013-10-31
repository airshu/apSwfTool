package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_add_i extends BaseInstruction
	{
		public function O_add_i(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0xc5;
			this.opcodeName = "add_i";
		}
	}
}