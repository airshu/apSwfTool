package com.alonepig.swf.records.actions.swf5
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionToString extends ActionRecord
	{
		public static const CODE:uint = 0x4b;
		
		public function ActionToString(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}