package com.alonepig.swf.records.actions.swf4
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionSetProperty extends ActionRecord
	{
		public static const CODE:uint = 0x23;
		
		public function ActionSetProperty(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}