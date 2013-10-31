package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_lessequals extends BaseInstruction
	{
		public function O_lessequals(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0xae;
			this.opcodeName = "lessequals";
		}
	}
}