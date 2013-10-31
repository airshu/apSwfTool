package com.alonepig.swf.records.actions.swf4
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionPop extends ActionRecord
	{
		public static const CODE:uint = 0x17;
		
		public function ActionPop(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}