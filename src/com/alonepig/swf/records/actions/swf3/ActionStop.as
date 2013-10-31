package com.alonepig.swf.records.actions.swf3
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionStop extends ActionRecord
	{
		public static const CODE:uint = 0x07;
		
		public function ActionStop(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}