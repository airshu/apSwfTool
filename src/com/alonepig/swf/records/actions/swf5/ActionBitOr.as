package com.alonepig.swf.records.actions.swf5
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionBitOr extends ActionRecord
	{
		public static const CODE:uint = 0x61;
		
		public function ActionBitOr(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}