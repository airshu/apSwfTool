package com.alonepig.swf.records.actions.swf6
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionStrictEquals extends ActionRecord
	{
		public static const CODE:uint = 0x66;
		
		public function ActionStrictEquals(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}