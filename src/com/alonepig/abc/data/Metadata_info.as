package com.alonepig.abc.data
{
	import com.alonepig.abc.ABCData;
	import com.alonepig.abc.BaseABCData;

	public class Metadata_info extends BaseABCData
	{
		/**
		 * 保存了常量池中字符串的下标 
		 */		
		public var name:int;
		public var nameStr:String;//name下标的字符串常量值，设置
		public var item_count:uint;
		
		public var items:Vector.<Item_info>;
		
		public function Metadata_info(bt:ABCData=null)
		{
			items = new Vector.<Item_info>();
			super(bt);
		}
		
		override public function read(bt:ABCData):void
		{
			name = bt.readU30();
			
			item_count = bt.readU30();
			
			for (var i:int = 0; i < item_count; i++) 
			{
				items.push( new Item_info(bt) );
			}
			
		}
		
		
	}
}