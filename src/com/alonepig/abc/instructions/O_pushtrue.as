package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_pushtrue extends BaseInstruction
	{
		public function O_pushtrue(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x26;
			this.opcodeName = "pushtrue";
		}
	}
}