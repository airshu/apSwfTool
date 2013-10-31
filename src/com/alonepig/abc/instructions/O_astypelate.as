package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_astypelate extends BaseInstruction
	{
		public function O_astypelate(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x87;
			this.opcodeName = "astypelate";
		}
	}
}