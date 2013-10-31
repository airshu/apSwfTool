package com.alonepig.swf.records.actions.swf5
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionReturn extends ActionRecord
	{
		public static const CODE:uint = 0x3e;
		
		public function ActionReturn(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}