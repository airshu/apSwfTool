package com.alonepig.swf.records.actions.swf3
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionWaitForFrame extends ActionRecord
	{
		public static const CODE:uint = 0x8a;
		/**
		 * 等待的帧 
		 */		
		public var frame:uint;
		/**
		 * 如果没有加载，跳过的动作数 
		 */		
		public var skipCount:uint;
		
		public function ActionWaitForFrame(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			frame = bt.readUI16();
			skipCount = bt.readUI8();
		}
	}
}