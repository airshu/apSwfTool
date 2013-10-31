package com.alonepig.swf.records.actions.swf4
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionStringExtract extends ActionRecord
	{
		public static const CODE:uint = 0x15;
		
		public function ActionStringExtract(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}