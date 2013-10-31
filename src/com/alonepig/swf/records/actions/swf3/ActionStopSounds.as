package com.alonepig.swf.records.actions.swf3
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionStopSounds extends ActionRecord
	{
		public static const CODE:uint = 0x09;
		
		public function ActionStopSounds(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}