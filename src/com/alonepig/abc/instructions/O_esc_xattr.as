package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_esc_xattr extends BaseInstruction
	{
		public function O_esc_xattr(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x72;
			this.opcodeName = "esc_xattr";
		}
	}
}