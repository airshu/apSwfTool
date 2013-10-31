package com.alonepig.swf.records.actions.swf3
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionGotoFrame extends ActionRecord
	{
		public static const CODE:uint = 0x81;
		
		public var frame:uint;
		
		public function ActionGotoFrame(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			frame = bt.readUI16();
		}
	}
}