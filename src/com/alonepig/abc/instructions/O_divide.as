package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_divide extends BaseInstruction
	{
		public function O_divide(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0xa3;
			this.opcodeName = "divide";
		}
	}
}