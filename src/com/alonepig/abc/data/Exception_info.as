package com.alonepig.abc.data
{
	import com.alonepig.abc.ABCData;
	import com.alonepig.abc.BaseABCData;
	
	public class Exception_info extends BaseABCData
	{
		public var from:int;
		public var to:int;
		public var target:int;
		public var exc_type:int;
		public var var_name:int;
		
		public function Exception_info(bt:ABCData=null)
		{
			super(bt);
		}
		
		override public function read(bt:ABCData):void
		{
			from = bt.readU32();
			to = bt.readU32();
			target = bt.readU32();
			exc_type = bt.readU32();
			var_name = bt.readU32();
			
		}
		
		
	}
}