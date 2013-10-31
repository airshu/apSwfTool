package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_negate extends BaseInstruction
	{
		public function O_negate(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x90;
			this.opcodeName = "negate";
		}
	}
}