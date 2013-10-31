package com.alonepig.swf.records.actions.swf4
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionAsciiToChar extends ActionRecord
	{
		public static const CODE:uint = 0x33;
		
		public function ActionAsciiToChar(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}