package com.alonepig.swf.records.actions.swf7
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionExtends extends ActionRecord
	{
		public static const CODE:uint = 0x69;
		
		public function ActionExtends(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}