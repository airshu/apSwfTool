package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_decrement extends BaseInstruction
	{
		public function O_decrement(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x93;
			this.opcodeName = "decrement";
		}
	}
}