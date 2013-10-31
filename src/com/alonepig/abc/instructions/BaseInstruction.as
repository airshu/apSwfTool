package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	import com.alonepig.abc.BaseABCData;
	
	
	
	/**
	 * 基础指令
	 * 
	 * 
	 */	
	public class BaseInstruction extends BaseABCData
	{
		public var bytesAvailable:int = 0;
		public var opcode:int = 0;
		public var opcodeName:String = "---------------";
		public function BaseInstruction(bt:ABCData = null)
		{
			if(bt)
				bytesAvailable = bt.length - bt.bytesAvailable - 1;
			super(bt);
		}
		
//		override public function read(bt:ABCData):void{
//			
//		}
//		override public function write(bt:ByteArray):void{
//			bt.writeByte(opcode);
//		}
//		override public function toString():String{
//			return "<font color='#ff0000'>" + bytesAvailable + "</font>" + "<font color='#888888'>[0x" + opcode.toString(16) + "]</font>" + opcodeName + "\t\t"
//		}
		
		public function toString():String
		{
			return "0x"+ opcode.toString(16) + " " + opcodeName + "\n";
		}
	}
}