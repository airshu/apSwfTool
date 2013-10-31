package com.alonepig.swf.records.actions.swf4
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionGetURL2 extends ActionRecord
	{
		public static const CODE:uint = 0x9a;
		
		public var sendVarsMethod:uint;
		public var reserved:uint;
		public var loadTargetFlag:Boolean;
		public var loadVariablesFlag:Boolean;
		
		public function ActionGetURL2(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			sendVarsMethod = bt.readUB(2);
			reserved = bt.readUB(4); // reserved, always 0
			loadTargetFlag = (bt.readUB(1) == 1);
			loadVariablesFlag = (bt.readUB(1) == 1);
		}
	}
}