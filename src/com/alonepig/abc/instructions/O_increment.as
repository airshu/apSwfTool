package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_increment extends BaseInstruction
	{
		public function O_increment(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x91;
			this.opcodeName = "increment";
		}
	}
}