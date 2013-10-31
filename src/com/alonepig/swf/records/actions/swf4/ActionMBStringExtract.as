package com.alonepig.swf.records.actions.swf4
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionMBStringExtract extends ActionRecord
	{
		public static const CODE:uint = 0x35;
		
		public function ActionMBStringExtract(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}