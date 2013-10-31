package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_add extends BaseInstruction
	{
		public function O_add(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0xa0;
			this.opcodeName = "add";
		}
	}
}