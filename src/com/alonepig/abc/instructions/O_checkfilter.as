package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_checkfilter extends BaseInstruction
	{
		public function O_checkfilter(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x78;
			this.opcodeName = "checkfilter";
		}
	}
}