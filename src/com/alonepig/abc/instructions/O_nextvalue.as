package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_nextvalue extends BaseInstruction
	{
		public function O_nextvalue(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x23;
			this.opcodeName = "nextvalue";
		}
	}
}