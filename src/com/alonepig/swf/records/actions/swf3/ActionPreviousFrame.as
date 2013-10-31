package com.alonepig.swf.records.actions.swf3
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionPreviousFrame extends ActionRecord
	{
		public static const CODE:uint = 0x05;
		
		public function ActionPreviousFrame(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}