package com.alonepig.swf.records.actions.swf4
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionSubtract extends ActionRecord
	{
		public static const CODE:uint = 0x0b;
		
		public function ActionSubtract(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}