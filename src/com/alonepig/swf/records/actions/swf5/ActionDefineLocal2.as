package com.alonepig.swf.records.actions.swf5
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionDefineLocal2 extends ActionRecord
	{
		public static const CODE:uint = 0x41;
		
		public function ActionDefineLocal2(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}