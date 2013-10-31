package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_newactivation extends BaseInstruction
	{
		public function O_newactivation(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x57;
			this.opcodeName = "newactivation";
		}
	}
}