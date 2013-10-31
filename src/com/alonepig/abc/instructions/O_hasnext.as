package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_hasnext extends BaseInstruction
	{
		public function O_hasnext(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x1f;
			this.opcodeName = "hasnext";
		}
	}
}