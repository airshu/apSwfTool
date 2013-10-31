package com.alonepig.swf.records.actions
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.BaseData;
	
	import flash.utils.getQualifiedClassName;
	
	
	public class ActionRecord extends BaseData
	{
		public var actionCode:uint;
		
		public var length:int;
		
		public function ActionRecord(bt:SWFData=null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
		}
		
		override public function toXML():XML
		{
			var xml:XML = <{getActionName()} />;
			xml.@actionCode = actionCode.toString(16);
			xml.@length = length;
//			xml.@name = getActionName();
			return xml;
		}
		
		private function getActionName():String
		{
			var name:String = getQualifiedClassName(this);
			var actionName:String = name.substring(name.lastIndexOf(":")+1);
			return actionName;
			
		}
	}
}