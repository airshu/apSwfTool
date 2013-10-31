package com.alonepig.abc.data
{
	import com.alonepig.abc.ABCData;
	import com.alonepig.abc.BaseABCData;
	
	public class String_info extends BaseABCData
	{
		public var size:int;
		public var utf8:String;
		
		public function String_info(bt:ABCData=null)
		{
			super(bt);
		}
		
		override public function read(bt:ABCData):void
		{
			size = bt.readU32();
			utf8 = bt.readUTFBytes( size );
		}
		
		
	}
}