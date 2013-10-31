package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_coerce_a extends BaseInstruction
	{
		public function O_coerce_a(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x82;
			this.opcodeName = "coerce_a";
		}
	}
}