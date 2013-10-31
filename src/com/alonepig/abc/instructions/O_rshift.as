package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_rshift extends BaseInstruction
	{
		public function O_rshift(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0xa6;
			this.opcodeName = "rshift";
		}
	}
}