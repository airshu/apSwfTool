package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_convert_o extends BaseInstruction
	{
		public function O_convert_o(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x77;
			this.opcodeName = "convert_o";
		}
	}
}