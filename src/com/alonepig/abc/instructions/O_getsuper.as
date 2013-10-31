package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	import com.alonepig.swf.data.EncodedU32;
	
	import flash.utils.ByteArray;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_getsuper extends BaseInstruction
	{
		public var index:int = 0;
		public function O_getsuper(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x04;
			this.opcodeName = "getsuper";
		}
		override public function read(bt:ABCData):void{
			this.index = EncodedU32.read(bt);
		}
//		override public function write(bt:ByteArray):void{
//			super.write(bt);
//			EncodedU32.write(bt, this.index);
//		}
//		override public function toString():String{
//			return super.toString() + index;
//		}
	}
}