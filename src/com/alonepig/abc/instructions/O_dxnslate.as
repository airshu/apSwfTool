package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_dxnslate extends BaseInstruction
	{
		public function O_dxnslate(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x07;
			this.opcodeName = "dxnslate";
		}
	}
}