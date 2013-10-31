package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	
	import flash.utils.getQualifiedClassName;

	public class BaseData
	{
		/**
		 * tag 类型 等于level
		 */		
		public var shapeType:int;
		
		public function BaseData(bt:SWFData = null)
		{
			if(bt != null){
				read(bt);
			}
		}
		
		public function read(bt:SWFData):void
		{
			
		}
		
		public function write(bt:SWFData):void
		{
			trace(getQualifiedClassName(this));
		}
		
		public function toString():String
		{
			return "BaseData";
		}
		
		public function encrypt():void
		{
			
		}
		
		public function toXML():XML
		{
			var xml:XML = <BaseData />;
			return xml;
		}
	}
}