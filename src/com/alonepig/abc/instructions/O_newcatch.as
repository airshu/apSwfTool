package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_newcatch extends BaseInstruction
	{
		public function O_newcatch(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x5a;
			this.opcodeName = "newcatch";
		}
	}
}