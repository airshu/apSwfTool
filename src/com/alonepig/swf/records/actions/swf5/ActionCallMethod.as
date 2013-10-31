package com.alonepig.swf.records.actions.swf5
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionCallMethod extends ActionRecord
	{
		public static const CODE:uint = 0x52;
		
		public function ActionCallMethod(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}