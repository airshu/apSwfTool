package com.alonepig.abc.traits
{
	import com.alonepig.abc.ABCData;
	import com.alonepig.abc.BaseABCData;
	import com.alonepig.swf.data.EncodedU32;
	
	
	/**
	 * 
	 */	
	public class Trait_function extends BaseABCData
	{
		public var slot_id:int;
		/**
		 * method 下标 
		 */		
		public var function_v:int;
		
		public function Trait_function(bt:ABCData=null)
		{
			super(bt);
		}
		
		override public function read(bt:ABCData):void
		{
			slot_id = EncodedU32.read(bt);
			function_v = EncodedU32.read(bt);
		}
		
//		override public function write(bt:ByteArray):void{
//			EncodedU32.write(bt, slot_id);
//			EncodedU32.write(bt, function_v);
//		}
//		override public function toString():String{
//			return "\t Trait_function:"
//				+ "\n\t\t  slot_id:" + slot_id
//				+ "\n\t\t  function_v:" + function_v
//		}
	}
}