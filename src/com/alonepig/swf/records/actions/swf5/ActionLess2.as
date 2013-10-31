package com.alonepig.swf.records.actions.swf5
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionLess2 extends ActionRecord
	{
		public static const CODE:uint = 0x48;
		
		public function ActionLess2(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}