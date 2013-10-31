package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_popscope extends BaseInstruction
	{
		public function O_popscope(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x1d;
			this.opcodeName = "popscope";
		}
	}
}