package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	import com.alonepig.swf.data.EncodedU32;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_callproplex extends BaseInstruction
	{
		public var index:int = 0;
		public var arg_count:int = 0;
		public function O_callproplex(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x4c;
			this.opcodeName = "callproplex";
		}
		override public function read(bt:ABCData):void{
			this.index = EncodedU32.read(bt);
			this.arg_count = EncodedU32.read(bt);
		}
		
//		override public function write(bt:ByteArray):void{
//			super.write(bt);
//			EncodedU32.write(bt, this.index);
//			EncodedU32.write(bt, this.arg_count);
//		}
	}
}