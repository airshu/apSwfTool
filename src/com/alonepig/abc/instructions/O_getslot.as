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
	public class O_getslot extends BaseInstruction
	{
		public var index:int = 0;
		public function O_getslot(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x6c;
			this.opcodeName = "getslot";
		}
		override public function read(bt:ABCData):void{
			this.index = EncodedU32.read(bt);
		}
//		override public function write(bt:ByteArray):void{
//			super.write(bt);
//			EncodedU32.write(bt, this.index);
//		}
	}
}