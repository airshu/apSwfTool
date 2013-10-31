package com.alonepig.swf.records.actions.swf4
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionDivide extends ActionRecord
	{
		public static const CODE:uint = 0x0d;
		
		public function ActionDivide(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}