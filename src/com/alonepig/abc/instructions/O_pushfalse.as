package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_pushfalse extends BaseInstruction
	{
		public function O_pushfalse(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x27;
			this.opcodeName = "pushfalse";
		}
	}
}