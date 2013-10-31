package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_pushwith extends BaseInstruction
	{
		public function O_pushwith(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x1c;
			this.opcodeName = "pushwith";
		}
	}
}