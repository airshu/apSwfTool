package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	
	public class Symbol extends BaseData
	{
		/**
		 * 导出的角色Id 
		 */		
		public var tagId:uint;
		/**
		 * 角色Id标识 
		 */		
		public var name:String;
		
		public function Symbol(bt:SWFData=null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			tagId = bt.readUI16();
			name = bt.readString();
		}
		
		override public function toXML():XML
		{
			var xml:XML = <Symbol />;
			xml.@tagId = tagId;
			xml.@name = name;
			return xml;
		}
		
	}
}