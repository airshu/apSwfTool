package com.alonepig.swf.records.actions.swf5
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionBitRShift extends ActionRecord
	{
		public static const CODE:uint = 0x64;
		
		public function ActionBitRShift(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}