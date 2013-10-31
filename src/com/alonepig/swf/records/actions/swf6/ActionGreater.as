package com.alonepig.swf.records.actions.swf6
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionGreater extends ActionRecord
	{
		public static const CODE:uint = 0x67;
		
		public function ActionGreater(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}