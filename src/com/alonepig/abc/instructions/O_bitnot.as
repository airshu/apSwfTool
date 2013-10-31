package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_bitnot extends BaseInstruction
	{
		public function O_bitnot(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x97;
			this.opcodeName = "bitnot";
		}
	}
}