package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_typeof extends BaseInstruction
	{
		public function O_typeof(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x95;
			this.opcodeName = "typeof";
		}
	}
}