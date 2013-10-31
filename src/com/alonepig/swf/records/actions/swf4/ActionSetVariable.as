package com.alonepig.swf.records.actions.swf4
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionSetVariable extends ActionRecord
	{
		public static const CODE:uint = 0x1d;
		
		public function ActionSetVariable(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}