package com.alonepig.abc.data
{
	import com.alonepig.abc.ABCData;
	import com.alonepig.abc.BaseABCData;

	/**
	 * 一个AS文件 
	 */	
	public class Script_info extends BaseABCData
	{
		/**
		 * method 下标
		 */		
		public var init:int;
		
		public var trait_count:int;
		public var traits:Vector.<Traits_info>;
		
		public function Script_info(bt:ABCData=null)
		{
			traits = new Vector.<Traits_info>();
			super(bt);
		}
		
		override public function read(bt:ABCData):void
		{
			init = bt.readU32();
			trait_count = bt.readU32();
			
			for (var i:int = 0; i < trait_count; i++) 
			{
				traits.push( new Traits_info(bt) );
			}
		}
		
		
	}
}