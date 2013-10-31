package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_nextname extends BaseInstruction
	{
		public function O_nextname(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x1e;
			this.opcodeName = "nextname";
		}
	}
}