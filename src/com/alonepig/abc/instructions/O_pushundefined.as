package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_pushundefined extends BaseInstruction
	{
		public function O_pushundefined(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x21;
			this.opcodeName = "pushundefined";
		}
	}
}