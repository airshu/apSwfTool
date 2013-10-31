package com.alonepig.swf.tags
{
	import flash.utils.ByteArray;

	/**
	 * type = 8 
	 * 
	 */	
	public class JPEGTables extends Tag
	{
		public var jpegData:ByteArray;
		
		public function JPEGTables()
		{
			jpegData = new ByteArray();
			super();
		}
		
		override public function parse():void
		{
			if(tagLength>0)
				bt.readBytes(jpegData, 0, tagLength);				
		}
		
		override public function toXML():XML
		{
			var xml:XML = <JPEGTables />;
			xml.@type = tagType;
			xml.@length = tagLength;
			return xml;
		}
	}
}