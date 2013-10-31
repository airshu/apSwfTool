package com.alonepig.swf.records.actions.swf4
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionMBCharToAscii extends ActionRecord
	{
		public static const CODE:uint = 0x36;
		
		public function ActionMBCharToAscii(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}