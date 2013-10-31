package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_esc_xelem extends BaseInstruction
	{
		public function O_esc_xelem(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x71;
			this.opcodeName = "esc_xelem";
		}
	}
}