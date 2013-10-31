package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_bitxor extends BaseInstruction
	{
		public function O_bitxor(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0xaa;
			this.opcodeName = "bitxor";
		}
	}
}