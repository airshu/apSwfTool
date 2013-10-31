package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_dup extends BaseInstruction
	{
		public function O_dup(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x2a;
			this.opcodeName = "dup";
		}
	}
}