package com.alonepig.swf.tags
{
	import com.alonepig.swf.SWFData;

	/**
	 * type = 62 
	 * 
	 */	
	public class DefineFontInfo2 extends DefineFontInfo
	{
		
		public var languageCode:int;
		
		public function DefineFontInfo2()
		{
			super();
		}
		
		
		override protected function parseLangCode(data:SWFData):void 
		{
			languageCode = data.readUI8();
			langCodeLength = 1;
		}
		
		
		override public function toXML():XML
		{
			var xml:XML = <DefineFontInfo2 />;
			xml.@type = tagType;
			xml.@length = tagLength;
			xml.@fontId = fontId;
			xml.@fontNameLen = fontNameLen;
			xml.@fontName = fontName;
			return xml;
		}
	}
}