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
	public class O_lookupswitch extends BaseInstruction
	{
		public var default_offset:int = 0;
		public var case_count:int = 0;
		public var case_offsets:Array = [];
		public function O_lookupswitch(bt:ABCData = null)
		{
			super(bt);
			this.opcode = 0x1b;
			this.opcodeName = "lookupswitch";
		}
		override public function read(bt:ABCData):void{
			default_offset = Tools.readS24(bt);
			case_count = EncodedU32.read(bt);
			for(var i:int = 0; i < case_count + 1; i++){
				case_offsets.push(Tools.readS24(bt));
			}
		}
//		override public function write(bt:ByteArray):void{
//			super.write(bt);
//			if(default_offset == int.MAX_VALUE){
//				return;//说明是在混淆
//			}
//			Tools.writeS24(bt, default_offset);
//			EncodedU32.write(bt, case_count);
//			for(var i:int = 0; i < case_count + 1; i++){
//				Tools.writeS24(bt, case_offsets[i]);
//			}
//		}
//		override public function toString():String{
//			return super.toString() + default_offset + "," + case_count;
//		}
	}
}