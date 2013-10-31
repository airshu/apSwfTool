package com.alonepig.swf.records.actions.swf5
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionCallFunction extends ActionRecord
	{
		public static const CODE:uint = 0x3d;
		
		public function ActionCallFunction(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}