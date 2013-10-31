package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	import flash.utils.ByteArray;
	
	
	/**
	 * 
getlocal_<n>
Operation
Get a local register.
Format
getlocal_<n>
Forms
getlocal_0 = 208 (0xd0)
getlocal_1 = 209 (0xd1)
getlocal_2 = 210 (0xd2)
getlocal_3 = 211 (0xd3)
Stack
… => …, value
Description
<n> is the index of a local register. The value of that register is pushed onto the stack.
	 * 
	 * 
	 */	
	public class O_getlocal_n extends BaseInstruction
	{
		/**
		 * 
		 * @param c 0xd0\0xd1\0xd2\0xd3
		 * 
		 */		
		public function O_getlocal_n(c:int, bt:ABCData = null)
		{
			super(bt);
			if(c < 0xd0 || c > 0xd3){
				throw new Error("O_getlocal_n opcode out range");
			}
			this.opcode = c;//0xd0
			this.opcodeName = "getlocal_n";
		}
		public function get n():int{
			return this.opcode - 0xd0;
		}
//		override public function toString():String{
//			return super.toString() + n;
//		}
	}
}