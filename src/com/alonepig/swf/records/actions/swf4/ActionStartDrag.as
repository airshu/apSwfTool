package com.alonepig.swf.records.actions.swf4
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionStartDrag extends ActionRecord
	{
		public static const CODE:uint = 0x27;
		
		public function ActionStartDrag(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}