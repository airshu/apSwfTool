package com.alonepig.swf.records.actions.swf5
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionDefineLocal extends ActionRecord
	{
		public static const CODE:uint = 0x3c;
		
		public function ActionDefineLocal(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}