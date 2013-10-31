package com.alonepig.swf.records.actions.swf5
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionIncrement extends ActionRecord
	{
		public static const CODE:uint = 0x50;
		
		public function ActionIncrement(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}