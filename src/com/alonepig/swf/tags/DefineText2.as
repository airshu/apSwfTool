package com.alonepig.swf.tags
{
	/**
	 * type = 33 
	 * 
	 */	
	public class DefineText2 extends DefineText
	{
		public function DefineText2()
		{
			super();
		}
		
		
		
		override public function get level():uint { return 2; }
		
		
		override public function toXML():XML
		{
			var xml:XML = <DefineText2 />;
			xml.@type = tagType;
			xml.@length = tagLength;
			xml.@characterId = characterId;
			xml.@textBounds = textBounds.toString();
			xml.@textMatrix = textMatrix.toString();
			xml.@glyphBits = glyphBits;
			xml.@advanceBits = advanceBits;
			
			return xml;
		}
	}
}