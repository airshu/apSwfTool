package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_pushnan extends BaseInstruction
	{
		public function O_pushnan(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x28;
			this.opcodeName = "pushnan";
		}
	}
}