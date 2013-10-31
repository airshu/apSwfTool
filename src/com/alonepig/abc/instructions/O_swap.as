package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_swap extends BaseInstruction
	{
		public function O_swap(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x2b;
			this.opcodeName = "swap";
		}
	}
}