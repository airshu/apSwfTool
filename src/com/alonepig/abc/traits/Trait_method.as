package com.alonepig.abc.traits
{
	import com.alonepig.abc.ABCData;
	import com.alonepig.abc.BaseABCData;
	
	/**
	 * 
	 */	
	public class Trait_method extends BaseABCData
	{
		public var disp_id:int;
		public var method:int;
		
		public function Trait_method(bt:ABCData=null)
		{
			super(bt);
		}
		
		override public function read(bt:ABCData):void
		{
			disp_id = bt.readU32();
			method = bt.readU32();
		}
		
//		override public function write(bt:ByteArray):void{
//			EncodedU32.write(bt, disp_id);
//			EncodedU32.write(bt, method_v);
//		}
//		
//		override public function toString():String{
//			return "\t Trait_method"
//				+ "\n\t\t  disp_id:" + disp_id
//				+ "\n\t\t  method_v:" + method_v
//		}
	}
}