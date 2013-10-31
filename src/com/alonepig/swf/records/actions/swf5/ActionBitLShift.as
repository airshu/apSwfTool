package com.alonepig.swf.records.actions.swf5
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionBitLShift extends ActionRecord
	{
		public static const CODE:uint = 0x63;
		
		public function ActionBitLShift(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}