package com.alonepig.swf.records.actions.swf4
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionCloneSprite extends ActionRecord
	{
		public static const CODE:uint = 0x24;
		
		public function ActionCloneSprite(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
	}
}