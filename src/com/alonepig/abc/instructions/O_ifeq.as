package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	import com.alonepig.utils.Tools;
	
	import flash.utils.ByteArray;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_ifeq extends BaseInstruction
	{
		public var offset:int = 0;
		public function O_ifeq(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x13;
			this.opcodeName = "ifeq";
		}
		override public function read(bt:ABCData):void{
			offset = Tools.readS24(bt);
		}
//		override public function write(bt:ByteArray):void{
//			super.write(bt);
//			Tools.writeS24(bt, offset);
//		}
//		override public function toString():String{
//			return super.toString() + "<font color='#0033FF'>" + offset + "</font>";
//		}
	}
}