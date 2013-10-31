package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_increment_i extends BaseInstruction
	{
		public function O_increment_i(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0xc0;
			this.opcodeName = "increment_i";
		}
	}
}