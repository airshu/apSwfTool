package com.alonepig.swf.records.actions.swf4
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionWaitForFrame2 extends ActionRecord
	{
		public static const CODE:uint = 0x8d;
		
		public var skipCount:uint;
		
		public function ActionWaitForFrame2(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			skipCount = bt.readUI8();
		}
	}
}