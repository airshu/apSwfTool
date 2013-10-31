package com.alonepig.swf.records.actions.swf4
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionRandomNumber extends ActionRecord
	{
		public static const CODE:uint = 0x30;
		
		public function ActionRandomNumber(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}