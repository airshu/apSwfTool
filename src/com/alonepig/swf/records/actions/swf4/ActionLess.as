package com.alonepig.swf.records.actions.swf4
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionLess extends ActionRecord
	{
		public static const CODE:uint = 0x0f;
		
		public function ActionLess(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}