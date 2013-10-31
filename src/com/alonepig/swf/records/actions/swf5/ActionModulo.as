package com.alonepig.swf.records.actions.swf5
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionModulo extends ActionRecord
	{
		public static const CODE:uint = 0x3f;
		
		public function ActionModulo(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}