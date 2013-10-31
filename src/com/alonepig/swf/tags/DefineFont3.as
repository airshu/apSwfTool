package com.alonepig.swf.tags
{
	/**
	 * type =  75
	 * 
	 */	
	public class DefineFont3 extends DefineFont2
	{
		public function DefineFont3()
		{
			super();
		}
		
		override public function toXML():XML
		{
			var xml:XML = <DefineFont3 />;
			xml.@type = tagType;
			xml.@fontFlagsHasLayout = fontFlagsHasLayout;
			xml.@fontFlagsShiftJIS = fontFlagsShiftJIS;
			xml.@fontFlagsSmallText = fontFlagsSmallText;
			xml.@fontFlagsANSI = fontFlagsANSI;
			xml.@fontFlagsWideOffsets = fontFlagsWideOffsets;
			xml.@fontFlagsWideCodes = fontFlagsWideCodes;
			xml.@fontFlagsItalic = fontFlagsItalic;
			xml.@fontFlagsBold = fontFlagsBold;
			xml.@languageCode = languageCode;
			xml.@fontNameLen = fontNameLen;
			xml.@fontName = fontName;
			xml.@numGlyphs = numGlyphs;
			var i:int;
			if(fontFlagsHasLayout)
			{
				xml.@fontAscent = fontAscent;
				xml.@fontDescent = fontDescent;
				xml.@fontLeading = fontLeading;
				xml.@kerningCount =  kerningCount;
			}
			
			return xml;
		}
		
		
		
		
	}
}