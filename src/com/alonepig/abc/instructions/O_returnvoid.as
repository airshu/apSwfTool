package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_returnvoid extends BaseInstruction
	{
		public function O_returnvoid(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x47;
			this.opcodeName = "returnvoid";
		}
	}
}