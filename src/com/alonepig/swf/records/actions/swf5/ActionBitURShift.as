package com.alonepig.swf.records.actions.swf5
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionBitURShift extends ActionRecord
	{
		public static const CODE:uint = 0x65;
		
		public function ActionBitURShift(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}