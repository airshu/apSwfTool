package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_convert_d extends BaseInstruction
	{
		public function O_convert_d(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x75;
			this.opcodeName = "convert_d";
		}
	}
}