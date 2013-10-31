package com.alonepig.swf.tags
{
	import flash.utils.ByteArray;

	/**
	 * type = 87 
	 * 
	 */	
	public class DefineBinaryData extends Tag
	{
		/**
		 * 16位 character id
		 */		
		public var tag:uint;
		public var reserved:uint;
		public var data:ByteArray;
		
		public function DefineBinaryData()
		{
			super();
		}
		
		override public function parse():void
		{
			tag = bt.readUnsignedShort();
			reserved = bt.readUnsignedInt();
			if(tagLength>6)
				bt.readBytes(data, 0, tagLength - 6);
		}
		
		override public function toXML():XML
		{
			var xml:XML = <DefineBinaryData />;
			xml.@type = tagType;
			xml.@length = tagLength;
			xml.@tag = tag;
			
			return xml;
		}
		
	}
}