package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_istypelate extends BaseInstruction
	{
		public function O_istypelate(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0xb3;
			this.opcodeName = "istypelate";
		}
	}
}