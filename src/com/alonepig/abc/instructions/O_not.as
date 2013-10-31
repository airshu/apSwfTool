package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_not extends BaseInstruction
	{
		public function O_not(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x96;
			this.opcodeName = "not";
		}
	}
}