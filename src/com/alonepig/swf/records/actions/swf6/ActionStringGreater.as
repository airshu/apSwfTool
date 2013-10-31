package com.alonepig.swf.records.actions.swf6
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionStringGreater extends ActionRecord
	{
		public static const CODE:uint = 0x68;
		
		public function ActionStringGreater(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}