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
	public class O_pushshort extends BaseInstruction
	{
		public var value:int = 0;
		public function O_pushshort(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x25;
			this.opcodeName = "pushshort";
		}
		override public function read(bt:ABCData):void{
			this.value = EncodedU32.read(bt);
		}
//		override public function write(bt:ByteArray):void{
//			super.write(bt);
//			EncodedU32.write(bt, this.value);
//		}
	}
}