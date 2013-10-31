package com.alonepig.abc.traits
{
	import com.alonepig.abc.ABCData;
	import com.alonepig.abc.BaseABCData;
	
	
	/**
	 * 
	 */	
	public class Trait_class extends BaseABCData
	{
		public var slot_id:int;
		/**
		 * classs 下标 
		 */		
		public var classi:int;
		
		public function Trait_class(bt:ABCData=null)
		{
			super(bt);
		}
		
		override public function read(bt:ABCData):void
		{
			slot_id = bt.readU32();
			classi = bt.readU32();
		}
		
//		override public function write(bt:ByteArray):void{
//			EncodedU32.write(bt, slot_id);
//			EncodedU32.write(bt, classi);
//		}
//		override public function encrypt():void{
////			classi = 1;
//		}
//		override public function toString():String{
//			return "\t Trait_class:"
//				+ "\n\t\t  slot_id:" + slot_id
//				+ "\n\t\t  classi:" + classi
//		}
	}
}