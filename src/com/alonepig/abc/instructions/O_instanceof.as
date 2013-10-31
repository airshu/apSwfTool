package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_instanceof extends BaseInstruction
	{
		public function O_instanceof(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0xb1;
			this.opcodeName = "instanceof";
		}
	}
}