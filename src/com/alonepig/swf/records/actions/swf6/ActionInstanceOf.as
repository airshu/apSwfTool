package com.alonepig.swf.records.actions.swf6
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionInstanceOf extends ActionRecord
	{
		public static const CODE:uint = 0x54;
		
		public function ActionInstanceOf(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}