package com.alonepig.swf.records.actions.swf4
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionTrace extends ActionRecord
	{
		public static const CODE:uint = 0x26;
		
		public function ActionTrace(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}