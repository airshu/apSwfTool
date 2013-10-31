package com.alonepig.swf.records.actions.swf4
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionMBStringLength extends ActionRecord
	{
		public static const CODE:uint = 0x31;
		
		public function ActionMBStringLength(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}