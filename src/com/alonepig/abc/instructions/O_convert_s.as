package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_convert_s extends BaseInstruction
	{
		public function O_convert_s(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x70;
			this.opcodeName = "convert_s";
		}
	}
}