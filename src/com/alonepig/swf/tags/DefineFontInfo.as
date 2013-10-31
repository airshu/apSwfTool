package com.alonepig.swf.tags
{
	import com.alonepig.swf.SWFData;
	
	import flash.utils.ByteArray;

	/**
	 * type = 13 
	 * 
	 */	
	public class DefineFontInfo extends Tag
	{
		public var fontId:uint;
		public var fontNameLen:uint;
		public var fontName:String;
		public var fontFlagsReserved:int;
		public var fontFlagsSmallText:int;
		public var fontFlagsShiftJIS:int;
		public var fontFlagsANSI:int;
		public var fontFlagsItalic:int;
		public var fontFlagsBold:int;
		public var fontFlagsWideCodes:int;
		public var codeTable:Vector.<int>;
		
		protected var langCodeLength:uint = 0;
		
		public function DefineFontInfo()
		{
			codeTable = new Vector.<int>();
		}
		
		override public function parse():void
		{
			fontId = bt.readUI16();
			
			var fontNameLen:uint = bt.readUI8();
			var fontNameRaw:ByteArray = new ByteArray();
			bt.readBytes(fontNameRaw, 0, fontNameLen);
			fontName = fontNameRaw.readUTFBytes(fontNameLen);
			
			var flags:uint = bt.readUI8();
			fontFlagsSmallText = (flags & 0x20) > 0 ? 1 : 0;
			fontFlagsShiftJIS = (flags & 0x10) != 0 ? 1 : 0;
			fontFlagsANSI = (flags & 0x08) != 0 ? 1 : 0;
			fontFlagsItalic = (flags & 0x04) != 0 ? 1 : 0;
			fontFlagsBold = (flags & 0x02) != 0 ? 1 : 0;
			fontFlagsWideCodes = (flags & 0x01) != 0 ? 1 : 0;
			
			parseLangCode(bt);
			
			var numGlyphs:uint = length - fontNameLen - langCodeLength - 4;
			for (var i:uint = 0; i < numGlyphs; i++) {
				codeTable.push(fontFlagsWideCodes ? bt.readUI16() : bt.readUI8());
			}
		}
		
		protected function parseLangCode(data:SWFData):void {
			// Does nothing here.
			// Overridden in TagDefineFontInfo2, where it:
			// - reads langCode
			// - sets langCodeLength to 1
		}
		
		override public function toXML():XML
		{
			var xml:XML = <DefineFontInfo />;
			xml.@type = tagType;
			xml.@length = tagLength;
			xml.@fontId = fontId;
			xml.@fontNameLen = fontNameLen;
			xml.@fontName = fontName;
			return xml;
		}
	}
}