package com.alonepig.swf.records.actions.swf5
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionDecrement extends ActionRecord
	{
		public static const CODE:uint = 0x51;
		
		public function ActionDecrement(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}