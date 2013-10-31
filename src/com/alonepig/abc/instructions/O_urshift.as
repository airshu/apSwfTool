package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_urshift extends BaseInstruction
	{
		public function O_urshift(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0xa7;
			this.opcodeName = "urshift";
		}
	}
}