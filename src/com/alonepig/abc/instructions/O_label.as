package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_label extends BaseInstruction
	{
		public function O_label(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x09;
			this.opcodeName = "label";
		}
	}
}