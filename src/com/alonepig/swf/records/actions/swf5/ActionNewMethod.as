package com.alonepig.swf.records.actions.swf5
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionNewMethod extends ActionRecord
	{
		public static const CODE:uint = 0x53;
		
		public function ActionNewMethod(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}