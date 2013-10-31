package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * setlocal_<n>
Operation
Set a local register.
Format
setlocal_<n>
Forms
setlocal_0 = 212 (0xd4)
setlocal_1 = 213 (0xd5)
setlocal_2 = 214 (0xd6)
setlocal_3 = 215 (0xd7)
Stack
…, value => …
Description
<n> is an index of a local
	 * 
	 * 
	 */	
	public class O_setlocal_n extends BaseInstruction
	{
		/**
		 * 
		 * @param c 0xd4\0xd5\0xd6\0xd7
		 * 
		 */		
		public function O_setlocal_n(c:int, bt:ABCData = null)
		{
			super(bt);
			if(c < 0xd4 || c > 0xd7){
				throw new Error("O_setlocal_n opcode out range");
			}
			this.opcode = c;//0xd0
			this.opcodeName = "setlocal_n";
		}
		public function get n():int{
			return this.opcode - 0xd4;
		}
//		override public function toString():String{
//			return super.toString() + n;
//		}
	}
}