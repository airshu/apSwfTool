package com.alonepig.swf.records.actions.swf5
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionBitAnd extends ActionRecord
	{
		public static const CODE:uint = 0x60;
		
		public function ActionBitAnd(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}