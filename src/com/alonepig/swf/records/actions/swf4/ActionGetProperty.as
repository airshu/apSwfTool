package com.alonepig.swf.records.actions.swf4
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionGetProperty extends ActionRecord
	{
		public static const CODE:uint = 0x22;
		
		public function ActionGetProperty(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}