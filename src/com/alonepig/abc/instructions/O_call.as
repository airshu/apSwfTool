package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	import com.alonepig.swf.data.EncodedU32;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_call extends BaseInstruction
	{
		public var arg_count:int = 0;
		public function O_call(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x41;
			this.opcodeName = "call";
		}
		override public function read(bt:ABCData):void
		{
			this.arg_count = EncodedU32.read(bt);
		}
		
//		override public function write(bt:ByteArray):void{
//			super.write(bt);
//			EncodedU32.write(bt, this.arg_count);
//		}
	}
}