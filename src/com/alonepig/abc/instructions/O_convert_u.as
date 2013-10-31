package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_convert_u extends BaseInstruction
	{
		public function O_convert_u(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x74;
			this.opcodeName = "convert_u";
		}
	}
}