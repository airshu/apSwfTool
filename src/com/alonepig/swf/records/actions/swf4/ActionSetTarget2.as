package com.alonepig.swf.records.actions.swf4
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionSetTarget2 extends ActionRecord
	{
		public static const CODE:uint = 0x20;
		
		public function ActionSetTarget2(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}