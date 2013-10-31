package com.alonepig.swf.records.actions.swf3
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionGetURL extends ActionRecord
	{
		public static const CODE:uint = 0x83;
		
		public var urlString:String;
		public var targetString:String;
		
		public function ActionGetURL(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			urlString = bt.readString();
			targetString = bt.readString();
		}
	}
}