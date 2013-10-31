package com.alonepig.swf.records.actions.swf7
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionThrow extends ActionRecord
	{
		public static const CODE:uint = 0x2a;
		
		public function ActionThrow(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}