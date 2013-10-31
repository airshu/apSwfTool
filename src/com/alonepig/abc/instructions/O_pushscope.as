package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 将一个对象添加到作用域栈
	 * 
	 */	
	public class O_pushscope extends BaseInstruction
	{
		public function O_pushscope(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x30;
			this.opcodeName = "pushscope";
		}
	}
}