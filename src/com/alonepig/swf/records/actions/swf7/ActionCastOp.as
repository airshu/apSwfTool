package com.alonepig.swf.records.actions.swf7
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionCastOp extends ActionRecord
	{
		public static const CODE:uint = 0x2b;
		
		public function ActionCastOp(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}