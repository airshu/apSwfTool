package com.alonepig.abc.data
{
	import com.alonepig.abc.ABCData;
	import com.alonepig.abc.BaseABCData;
	
	/**
	 * 保存的都是位置，需要通过字符串迟来获取实际值 
	 * 
	 */	
	public class Item_info extends BaseABCData
	{
		public var key:uint;
		public var value:uint;
		
		// 保存实际值
		public var keyStr:String;
		public var valueStr:String;
		
		public function Item_info(bt:ABCData=null)
		{
			super(bt);
		}
		
		override public function read(bt:ABCData):void
		{
			key = bt.readU32();
			value = bt.readU32();
		}
		
		
	}
}