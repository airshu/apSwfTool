package com.alonepig.swf.records.actions.swf7
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.RegisterParam;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionDefineFunction2 extends ActionRecord
	{
		public static const CODE:uint = 0x8e;
		
		public var functionName:String;
		public var functionParams:Vector.<RegisterParam>;
		public var functionBody:Vector.<ActionRecord>;
		public var registerCount:uint;
		
		public var preloadParent:Boolean;
		public var preloadRoot:Boolean;
		public var preloadSuper:Boolean;
		public var preloadArguments:Boolean;
		public var preloadThis:Boolean;
		public var preloadGlobal:Boolean;
		public var suppressSuper:Boolean;
		public var suppressArguments:Boolean;
		public var suppressThis:Boolean;
		
		public function ActionDefineFunction2(bt:SWFData=null)
		{
			actionCode = CODE;
			functionParams = new Vector.<RegisterParam>();
			functionBody = new Vector.<ActionRecord>();
			
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			functionName = bt.readString();
			var numParams:uint = bt.readUI16();
			registerCount = bt.readUI8();
			var flags1:uint = bt.readUI8();
			preloadParent = ((flags1 & 0x80) != 0);
			preloadRoot = ((flags1 & 0x40) != 0);
			suppressSuper = ((flags1 & 0x20) != 0);
			preloadSuper = ((flags1 & 0x10) != 0);
			suppressArguments = ((flags1 & 0x08) != 0);
			preloadArguments = ((flags1 & 0x04) != 0);
			suppressThis = ((flags1 & 0x02) != 0);
			preloadThis = ((flags1 & 0x01) != 0);
			var flags2:uint = bt.readUI8();
			preloadGlobal = ((flags2 & 0x01) != 0);
			for (var i:uint = 0; i < numParams; i++) {
				functionParams.push(new RegisterParam(bt) );
			}
			var codeSize:uint = bt.readUI16();
			var bodyEndPosition:uint = bt.position + codeSize;
			while (bt.position < bodyEndPosition) {
				functionBody.push(bt.readActionRecord());
			}
		}
	}
}