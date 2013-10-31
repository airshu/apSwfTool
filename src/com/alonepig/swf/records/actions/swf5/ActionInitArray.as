package com.alonepig.swf.records.actions.swf5
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionInitArray extends ActionRecord
	{
		public static const CODE:uint = 0x42;
		
		public function ActionInitArray(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}