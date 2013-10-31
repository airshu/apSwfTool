package com.alonepig.swf.records.actions.swf5
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionNewObject extends ActionRecord
	{
		public static const CODE:uint = 0x40;
		
		public function ActionNewObject(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}