package com.alonepig.swf.records.actions.swf4
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionGotoFrame2 extends ActionRecord
	{
		public static const CODE:uint = 0x9f;
		
		public var sceneBiasFlag:Boolean;
		public var playFlag:Boolean;
		public var sceneBias:uint;
		
		public function ActionGotoFrame2(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			var flags:uint = bt.readUI8();
			sceneBiasFlag = ((flags & 0x02) != 0);
			playFlag = ((flags & 0x01) != 0);
			if (sceneBiasFlag) 
			{
				sceneBias = bt.readUI16();
			}
		}
	}
}