package com.alonepig.swf.records.actions.swf7
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.actions.ActionRecord;
	
	public class ActionTry extends ActionRecord
	{
		public static const CODE:uint = 0x8f;
		
		public var catchInRegisterFlag:Boolean;
		public var finallyBlockFlag:Boolean;
		public var catchBlockFlag:Boolean;
		public var catchName:String;
		public var catchRegister:uint;
		public var tryBody:Vector.<ActionRecord>;
		public var catchBody:Vector.<ActionRecord>;
		public var finallyBody:Vector.<ActionRecord>;
		
		public function ActionTry(bt:SWFData=null)
		{
			actionCode = CODE;
			tryBody = new Vector.<ActionRecord>();
			catchBody = new Vector.<ActionRecord>();
			finallyBody = new Vector.<ActionRecord>();
			super(bt);
			
		}
		
		override public function read(bt:SWFData):void
		{
			var flags:uint = bt.readUI8();
			catchInRegisterFlag = ((flags & 0x04) != 0);
			finallyBlockFlag = ((flags & 0x02) != 0);
			catchBlockFlag = ((flags & 0x01) != 0);
			var trySize:uint = bt.readUI16();
			var catchSize:uint = bt.readUI16();
			var finallySize:uint = bt.readUI16();
			if (catchInRegisterFlag) {
				catchRegister = bt.readUI8();
			} else {
				catchName = bt.readString();
			}
			var tryEndPosition:uint = bt.position + trySize;
			while (bt.position < tryEndPosition) 
			{
				tryBody.push(bt.readActionRecord());
			}
			var catchEndPosition:uint = bt.position + catchSize;
			while (bt.position < catchEndPosition) 
			{
				catchBody.push(bt.readActionRecord());
			}
			var finallyEndPosition:uint = bt.position + finallySize;
			while (bt.position < finallyEndPosition) 
			{
				finallyBody.push(bt.readActionRecord());
			}
		}
	}
}