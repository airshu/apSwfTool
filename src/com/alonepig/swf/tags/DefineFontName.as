package com.alonepig.swf.tags
{
	import com.alonepig.utils.DString;
	

	/**
	 * type = 88 
	 * 
	 */	
	public class DefineFontName extends Tag
	{
		public var fontId:uint;
		public var fontName:String;
		public var fontCopyright:String;
		
		public function DefineFontName()
		{
			super();
		}
		
		override public function parse():void
		{
			fontId = bt.readUnsignedShort();
			fontName = DString.read(bt);
			fontCopyright = DString.read(bt);
		}
		
		override public function toXML():XML
		{
			var xml:XML = <DefineFontName />;
			xml.@type = tagType;
			xml.@length = tagLength;
			xml.@fontName = fontName;
			xml.@fontCopyright = fontCopyright;
			
			return xml;
		}
	}
}