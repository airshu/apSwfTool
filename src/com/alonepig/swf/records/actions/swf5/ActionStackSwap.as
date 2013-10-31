package com.alonepig.swf.records.actions.swf5
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionStackSwap extends ActionRecord
	{
		
		public static const CODE:uint = 0x4d;
		
		public function ActionStackSwap(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}