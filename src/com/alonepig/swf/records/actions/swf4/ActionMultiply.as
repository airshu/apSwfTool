package com.alonepig.swf.records.actions.swf4
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionMultiply extends ActionRecord
	{
		public static const CODE:uint = 0x0c;
		
		public function ActionMultiply(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}