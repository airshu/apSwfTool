package com.alonepig.swf.records.actions.swf4
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionGetVariable extends ActionRecord
	{
		public static const CODE:uint = 0x1c;
		
		public function ActionGetVariable(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}