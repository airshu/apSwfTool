package com.alonepig.swf.records.actions.swf5
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionDefineFunction extends ActionRecord
	{
		public static const CODE:uint = 0x9b;
		
		
		public var functionName:String;
		public var functionParams:Vector.<String>;
		public var functionBody:Vector.<ActionRecord>;
		
		public function ActionDefineFunction(bt:SWFData=null)
		{
			actionCode = CODE;
			functionParams = new Vector.<String>();
			functionBody = new Vector.<ActionRecord>();
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			functionName = bt.readString();
			var count:uint = bt.readUI16();
			for (var i:uint = 0; i < count; i++) {
				functionParams.push(bt.readString());
			}
			var codeSize:uint = bt.readUI16();
			var bodyEndPosition:uint = bt.position + codeSize;
			while (bt.position < bodyEndPosition) {
				functionBody.push(bt.readActionRecord());
			}
		}
	}
}