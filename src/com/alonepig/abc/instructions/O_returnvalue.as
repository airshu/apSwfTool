package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_returnvalue extends BaseInstruction
	{
		public function O_returnvalue(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x48;
			this.opcodeName = "returnvalue";
		}
	}
}