package com.alonepig.abc.instructions
{
	import com.alonepig.abc.ABCData;
	
	import flash.utils.ByteArray;
	
	
	/**
	 * 
	 * 
	 * 
	 */	
	public class O_hasnext2 extends BaseInstruction
	{
		public var object_reg:int = 0;
		public var index_reg:int = 0;
		public function O_hasnext2(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x32;
			this.opcodeName = "hasnext2";
		}
		override public function read(bt:ABCData):void{
			this.object_reg = bt.readUnsignedInt();
			this.index_reg = bt.readUnsignedInt();
		}
//		override public function write(bt:ByteArray):void{
//			super.write(bt);
//			bt.writeUnsignedInt(object_reg);
//			bt.writeUnsignedInt(index_reg);
//		}
	}
}