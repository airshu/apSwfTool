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
	public class O_getglobalslot extends BaseInstruction
	{
		public var slotindex:int = 0;
		public function O_getglobalslot(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x6e;
			this.opcodeName = "getglobalslot";
		}
		override public function read(bt:ABCData):void{
			this.slotindex = EncodedU32.read(bt);
		}
//		override public function write(bt:ByteArray):void{
//			super.write(bt);
//			EncodedU32.write(bt, this.slotindex);
//		}
//		override public function toString():String{
//			return super.toString() + slotindex;
//		}
	}
}