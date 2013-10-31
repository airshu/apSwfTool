package com.alonepig.swf.records.actions.swf6
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionEnumerate2 extends ActionRecord
	{
		public static const CODE:uint = 0x55;
		
		public function ActionEnumerate2(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}