package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 *  将一个值转换为整型 
	 */	
	public class O_convert_i extends BaseInstruction
	{
		public function O_convert_i(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x73;
			this.opcodeName = "convert_i";
		}
	}
}