package com.alonepig.swf.records.actions.swf3
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;

	public class ActionNextFrame extends ActionRecord
	{
		public static const CODE:uint = 0x04;
		
		public function ActionNextFrame(bt:SWFData=null)
		{
			actionCode = CODE;
		}
		
	}
}