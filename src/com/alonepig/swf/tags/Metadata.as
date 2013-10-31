package com.alonepig.swf.tags
{
	
	
	/**
	 * type = 77 
	 * 元数据标签
	 */	
	public class Metadata extends Tag
	{
		public var metadata:String;
		
		public function Metadata()
		{
			super();
		}
		
		override public function parse():void
		{
			super.parse();
			
			if(!allowChildParse){
				return;
			}
			metadata = bt.readString();
		}
		
		override public function toString():String
		{
			return super.toString() + "\n(Metadata):" + metadata;
		}
		
		override public function toXML():XML
		{
			var xml:XML = <Metadata />;
			xml.@type = tagType;
			xml.appendChild( new XML(metadata) );
//			xml.@metadata = metadata;
			
			return xml;
		}
	}
}