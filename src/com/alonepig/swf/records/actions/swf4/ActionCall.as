package com.alonepig.swf.records.actions.swf4
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionCall extends ActionRecord
	{
		public static const CODE:uint = 0x9e;
		
		public function ActionCall(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}