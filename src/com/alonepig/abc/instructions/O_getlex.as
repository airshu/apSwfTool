package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 找寻和获得属性
	 * 
	 */	
	public class O_getlex extends BaseInstruction
	{
		public var index:int = 0;
		
		public function O_getlex(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x60;
			this.opcodeName = "getlex";
		}
		override public function read(bt:ABCData):void
		{
			index = bt.readU32();
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