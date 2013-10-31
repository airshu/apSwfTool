package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_nop extends BaseInstruction
	{
		public function O_nop(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x02;
			this.opcodeName = "nop";
		}
	}
}