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
	public class O_debugline extends BaseInstruction
	{
		public var linenum:int;
		public function O_debugline(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0xf0;
			this.opcodeName = "debugline";
		}
		override public function read(bt:ABCData):void{
			this.linenum = EncodedU32.read(bt);
		}
//		override public function write(bt:ByteArray):void{
//			super.write(bt);
//			EncodedU32.write(bt, this.linenum);
//		}
//		override public function toString():String{
//			return super.toString() + linenum;
//		}
	}
}