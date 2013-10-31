package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 强制转换成字符串
	 * 与covert_s的区别在于null和undefined 不会转成"null"和"undefined"
	 */	
	public class O_coerce_s extends BaseInstruction
	{
		public function O_coerce_s(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x85;
			this.opcodeName = "coerce_s";
		}
	}
}