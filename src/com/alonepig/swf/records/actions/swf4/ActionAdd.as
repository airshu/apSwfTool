package com.alonepig.swf.records.actions.swf4
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionAdd extends ActionRecord
	{
		public static const CODE:uint = 0x0a;
		
		public function ActionAdd(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}