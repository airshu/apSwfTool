package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_modulo extends BaseInstruction
	{
		public function O_modulo(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0xa4;
			this.opcodeName = "modulo";
		}
	}
}