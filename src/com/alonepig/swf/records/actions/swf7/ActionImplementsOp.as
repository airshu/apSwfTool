package com.alonepig.swf.records.actions.swf7
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionImplementsOp extends ActionRecord
	{
		public static const CODE:uint = 0x2c;
		
		public function ActionImplementsOp(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}