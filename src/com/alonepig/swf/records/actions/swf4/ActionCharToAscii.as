package com.alonepig.swf.records.actions.swf4
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionCharToAscii extends ActionRecord
	{
		public static const CODE:uint = 0x32;
		
		public function ActionCharToAscii(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}