package com.alonepig.swf.records.actions.swf5
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionWith extends ActionRecord
	{
		public static const CODE:uint = 0x94;
		
		public var withBody:Vector.<ActionRecord>;
		
		public function ActionWith(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			var codeSize:uint = bt.readUI16();
			var bodyEndPosition:uint = bt.position + codeSize;
			while (bt.position < bodyEndPosition) {
				withBody.push(bt.readActionRecord());
			}
		}
	}
}