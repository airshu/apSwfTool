package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_in extends BaseInstruction
	{
		public function O_in(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0xb4;
			this.opcodeName = "in";
		}
	}
}