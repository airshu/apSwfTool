package com.alonepig.swf.tags
{
	import com.alonepig.utils.DString;
	
	import flash.utils.ByteArray;

	/**
	 * type = 91 
	 * 
	 */	
	public class DefineFont4 extends Tag
	{
		public var fontId:uint;
		public var fontFlagsReserved:uint;
		public var fontFlagsHasFontData:uint;
		public var fontFlagsItalic:uint;
		public var fontFlagsBold:uint;
		public var fontName:String;
		public var fontData:ByteArray;
		
		
		public function DefineFont4()
		{
			fontData = new ByteArray();
			super();
		}
		
		override public function parse():void
		{
			fontId = bt.readUnsignedShort();
			var flags:uint = bt.readUnsignedByte();
			fontFlagsHasFontData = flags & 0x04;
			fontFlagsItalic = flags & 0x02;
			fontFlagsBold = flags & 0x01;
			fontName = DString.read(bt);
			if(fontFlagsHasFontData && tagLength>bt.position)
				bt.readBytes(fontData, 0, tagLength-bt.position);
			
		}
		
		override public function toXML():XML
		{
			var xml:XML = <DefineFont4 />;
			xml.@type = tagType;
			xml.@fontId = fontId;
			xml.@fontFlagsHasFontData = fontFlagsHasFontData;
			xml.@fontFlagsItalic = fontFlagsItalic;
			xml.@fontFlagsBold = fontFlagsBold;
			xml.@fontName = fontName;
			
			return xml;
		}
	}
}