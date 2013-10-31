package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_equals extends BaseInstruction
	{
		public function O_equals(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0xab;
			this.opcodeName = "equals";
		}
	}
}