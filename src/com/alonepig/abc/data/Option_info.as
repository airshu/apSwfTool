package com.alonepig.abc.data
{
	import com.alonepig.abc.ABCData;
	import com.alonepig.abc.BaseABCData;
	
	public class Option_info extends BaseABCData
	{
		public var option_count:int;
		public var option:Vector.<Option_detail>;
		
		public function Option_info(bt:ABCData=null)
		{
			option = new Vector.<Option_detail>();
			super(bt);
		}
		
		override public function read(bt:ABCData):void
		{
			option_count = bt.readU30();
			
			for (var i:int = 0; i < option_count; i++) 
			{
				option.push( new Option_detail(bt) );
			}
			
		}
		
		
	}
}