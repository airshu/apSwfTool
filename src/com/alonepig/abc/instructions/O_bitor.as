package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_bitor extends BaseInstruction
	{
		public function O_bitor(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0xa9;
			this.opcodeName = "bitor";
		}
	}
}