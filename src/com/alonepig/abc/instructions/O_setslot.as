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
	public class O_setslot extends BaseInstruction
	{
		public var slotindex:int = 0;
		public function O_setslot(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x6d;
			this.opcodeName = "setslot";
		}
		override public function read(bt:ABCData):void{
			this.slotindex = EncodedU32.read(bt);
		}
//		override public function write(bt:ByteArray):void{
//			super.write(bt);
//			EncodedU32.write(bt, this.slotindex);
//		}
	}
}