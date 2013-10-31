package com.alonepig.swf.records.actions.swf5
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionTargetPath extends ActionRecord
	{
		public static const CODE:uint = 0x45;
		
		public function ActionTargetPath(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}