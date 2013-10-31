package com.alonepig.swf.records.actions.swf3
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionSetTarget extends ActionRecord
	{
		public static const CODE:uint = 0x8b;
		
		public var targetName:String;
		
		public function ActionSetTarget(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			targetName = bt.readString();
		}
	}
}