package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ClipActionRecord extends BaseData
	{
		public var eventFlags:ClipEventFlags;
		/**
		 * UI32 
		 */		
		public var actionRecordSize:uint;
		public var keyCode:uint;
		public var actions:Vector.<ActionRecord>;
		
		public function ClipActionRecord(bt:SWFData=null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			eventFlags = new ClipEventFlags(bt);
			actionRecordSize = bt.readUI32();
			if(eventFlags.keyPress)
			{
				keyCode = bt.readUI8();
			}
			actions = new Vector.<ActionRecord>();
			var actionRecord:ActionRecord;
			while((actionRecord = bt.readActionRecord()) != null)
				actions.push( actionRecord );
		}
	}
}