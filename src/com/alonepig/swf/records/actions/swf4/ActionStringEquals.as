package com.alonepig.swf.records.actions.swf4
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionStringEquals extends ActionRecord
	{
		public static const CODE:uint = 0x13;
		
		public function ActionStringEquals(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}