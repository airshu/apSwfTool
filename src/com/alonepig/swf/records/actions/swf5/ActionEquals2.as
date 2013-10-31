package com.alonepig.swf.records.actions.swf5
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionEquals2 extends ActionRecord
	{
		public static const CODE:uint = 0x49;
		
		public function ActionEquals2(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}