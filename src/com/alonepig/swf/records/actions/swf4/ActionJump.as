package com.alonepig.swf.records.actions.swf4
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionJump extends ActionRecord
	{
		public static const CODE:uint = 0x99;
		
		public var branchOffset:int;
		
		public function ActionJump(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			branchOffset = bt.readSI16();
		}
	}
}