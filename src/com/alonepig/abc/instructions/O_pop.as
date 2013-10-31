package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_pop extends BaseInstruction
	{
		public function O_pop(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x29;
			this.opcodeName = "pop";
		}
	}
}