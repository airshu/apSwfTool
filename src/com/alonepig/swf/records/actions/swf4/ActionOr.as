package com.alonepig.swf.records.actions.swf4
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionOr extends ActionRecord
	{
		public static const CODE:uint = 0x11;
		
		public function ActionOr(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}