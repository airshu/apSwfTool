package com.alonepig.swf.tags
{
	import com.alonepig.swf.records.Shape;

	/**
	 * type = 10 
	 * 该标签不能用于动态文字 
	 */	
	public class DefineFont extends Tag
	{
		public var fontId:uint;
		public var offsetTable:Vector.<uint>;
		public var glyphShapeTable:Vector.<Shape>;
		
		public function DefineFont()
		{
			offsetTable = new Vector.<uint>();
			glyphShapeTable = new Vector.<Shape>();
			super();
		}
		
		override public function parse():void
		{
			fontId = bt.readUnsignedShort();
			var numGlyphs:uint = bt.readUnsignedShort() >> 1;
			bt.position = (numGlyphs-1)<<1;
			for(var i:int=0; i<numGlyphs; i++)
			{
				glyphShapeTable.push( new Shape(bt) );
			}
		}
		
		override public function toXML():XML
		{
			var xml:XML = <DefineFont />;
			xml.@type = tagType;
			xml.@fontId = fontId;
			return xml;
		}
	}
}