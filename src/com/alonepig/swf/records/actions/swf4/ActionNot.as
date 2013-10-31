package com.alonepig.swf.records.actions.swf4
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionNot extends ActionRecord
	{
		public static const CODE:uint = 0x12;
		
		public function ActionNot(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}