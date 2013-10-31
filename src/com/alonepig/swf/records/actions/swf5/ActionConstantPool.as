package com.alonepig.swf.records.actions.swf5
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionConstantPool extends ActionRecord
	{
		public static const CODE:uint = 0x88;
		
		public var constants:Vector.<String>;
		
		public function ActionConstantPool(bt:SWFData=null)
		{
			actionCode = CODE;
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			constants = new Vector.<String>();
			var count:uint = bt.readUI16();
			for (var i:uint = 0; i < count; i++) {
				constants.push(bt.readString());
			}
		}
	}
}