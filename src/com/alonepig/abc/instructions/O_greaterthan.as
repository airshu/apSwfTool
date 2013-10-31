package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_greaterthan extends BaseInstruction
	{
		public function O_greaterthan(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0xaf;
			this.opcodeName = "greaterthan";
		}
	}
}