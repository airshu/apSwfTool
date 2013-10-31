package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	import com.alonepig.swf.data.EncodedU32;
	import com.alonepig.utils.Tools;
	
	import flash.utils.ByteArray;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_initproperty extends BaseInstruction
	{
		public var index:int = 0;
		public function O_initproperty(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x68;
			this.opcodeName = "initproperty";
		}
		override public function read(bt:ABCData):void{
			this.index = EncodedU32.read(bt);
		}
//		override public function write(bt:ByteArray):void{
//			super.write(bt);
//			EncodedU32.write(bt, this.index);
//		}
//		override public function toString():String{
//			return super.toString() + Tools.abcFile.cpool_info.arrMultiname_S[index - 1];
//		}
//		public function get opStr():String{
//			return Tools.abcFile.cpool_info.arrMultiname_S[index - 1];
//		}
	}
}