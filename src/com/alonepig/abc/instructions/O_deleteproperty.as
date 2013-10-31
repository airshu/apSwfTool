package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_deleteproperty extends BaseInstruction
	{
		public function O_deleteproperty(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x6a;
			this.opcodeName = "deleteproperty";
		}
	}
}