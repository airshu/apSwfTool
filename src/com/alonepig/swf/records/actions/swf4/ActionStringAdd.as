package com.alonepig.swf.records.actions.swf4
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionStringAdd extends ActionRecord
	{
		public static const CODE:uint = 0x21;
		
		public function ActionStringAdd(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}