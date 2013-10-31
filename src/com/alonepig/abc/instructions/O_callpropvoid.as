package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	
	/**
	 * 
	 * 调用(执行)属性 不考虑返回值
	 * 例如  callpropvoid trace, 1 args   1 args表示将上面的值放到trace的第一个参数
	 */	
	public class O_callpropvoid extends BaseInstruction
	{
		public var index:int = 0;
		public var arg_count:int = 0;
		
		public function O_callpropvoid(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x4f;
			this.opcodeName = "callpropvoid";
		}
		
		override public function read(bt:ABCData):void
		{
			index = bt.readU32();
			arg_count = bt.readU32();
		}
		
//		override public function write(bt:ByteArray):void{
//			super.write(bt);
//			EncodedU32.write(bt, this.index);
//			EncodedU32.write(bt, this.arg_count);
//		}
//		override public function toString():String{
//			return super.toString() + Tools.abcFile.cpool_info.arrMultiname_S[index - 1] + ",index:" + index + "，arg_count：" + arg_count;
//		}
	}
}