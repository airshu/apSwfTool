package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_convert_b extends BaseInstruction
	{
		public function O_convert_b(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x76;
			this.opcodeName = "convert_b";
		}
	}
}