package com.alonepig.swf.records.actions.swf5
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionBitXor extends ActionRecord
	{
		public static const CODE:uint = 0x62;
		
		public function ActionBitXor(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}