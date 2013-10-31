package com.alonepig.swf.records.actions.swf4
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionIf extends ActionRecord
	{
		public static const CODE:uint = 0x9d;
		
		public var branchOffset:int;
		
		public function ActionIf(bt:SWFData=null)
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