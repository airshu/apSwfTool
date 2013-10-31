package com.alonepig.swf.records.actions.swf4
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionStringLength extends ActionRecord
	{
		public static const CODE:uint = 0x14;
		
		public function ActionStringLength(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}