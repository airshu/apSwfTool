package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_getglobalscope extends BaseInstruction
	{
		public function O_getglobalscope(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x64;
			this.opcodeName = "getglobalscope";
		}
	}
}