package com.alonepig.swf.records.actions.swf3
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionPlay extends ActionRecord
	{
		
		public static const CODE:uint = 0x06;
		
		
		public function ActionPlay(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}