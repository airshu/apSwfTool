package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_strictequals extends BaseInstruction
	{
		public function O_strictequals(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0xac;
			this.opcodeName = "strictequals";
		}
	}
}