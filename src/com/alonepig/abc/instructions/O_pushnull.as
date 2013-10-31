package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_pushnull extends BaseInstruction
	{
		public function O_pushnull(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x20;
			this.opcodeName = "pushnull";
		}
	}
}