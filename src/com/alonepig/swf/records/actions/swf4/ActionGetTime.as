package com.alonepig.swf.records.actions.swf4
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionGetTime extends ActionRecord
	{
		public static const CODE:uint = 0x34;
		
		public function ActionGetTime(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}