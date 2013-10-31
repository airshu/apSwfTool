package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_bitand extends BaseInstruction
	{
		public function O_bitand(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0xa8;
			this.opcodeName = "bitand";
		}
	}
}