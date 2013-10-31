package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_lshift extends BaseInstruction
	{
		public function O_lshift(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0xa5;
			this.opcodeName = "lshift";
		}
	}
}