package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 找到属性
	 * 
	 */	
	public class O_findpropstrict extends BaseInstruction
	{
		/**
		 *multiname 下标 
		 */		
		public var index:int = 0;
		
		public function O_findpropstrict(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x5d;
			this.opcodeName = "findpropstrict";
		}
		
		override public function read(bt:ABCData):void
		{
			index = bt.readU32();
//			this.index = EncodedU32.read(bt);
		}
		
//		override public function write(bt:ByteArray):void{
//			super.write(bt);
//			EncodedU32.write(bt, this.index);
//		}
//		override public function toString():String{
//			return super.toString() + Tools.abcFile.cpool_info.arrMultiname_S[index - 1] + "," + index;
//		}
	}
}