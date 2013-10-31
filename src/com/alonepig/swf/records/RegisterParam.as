package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	
	public class RegisterParam extends BaseData
	{
		public var register:uint;
		public var name:String;
		
		public function RegisterParam(bt:SWFData=null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			register = bt.readUI8();
			name = bt.readString();
		}
	}
}