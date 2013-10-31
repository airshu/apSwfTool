package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	
	public class TextRecord extends BaseData
	{
		public var textRecordType:uint;
		public var styleFlagsReserved:uint;
		public var styleFlagsHasFont:uint;
		public var styleFlagsHasColor:uint;
		public var styleFlagsHasYOffset:uint;
		public var styleFlagsHasXOffset:uint;
		public var fontId:uint;
		/**
		 * RGB or RGBA 
		 */		
		public var textColor:*;
		public var xOffset:uint;
		public var yOffset:uint;
		public var textHeight:uint;
		public var glyphCount:uint;
		public var glyphEntries:Vector.<GlyphEntry>;
		
		
		public var level:uint;
		public var glyphBits:uint;
		public var advanceBits:uint;
		
		public function TextRecord(bt:SWFData=null)
		{
			glyphEntries = new Vector.<GlyphEntry>();
		}
		
		override public function read(bt:SWFData):void
		{
			var styles:uint = bt.readUI8();
			textRecordType = styles >> 7;
			styleFlagsHasFont = styles & 0x08;
			styleFlagsHasColor = styles & 0x04;
			styleFlagsHasYOffset = styles & 0x02;
			styleFlagsHasXOffset = styles & 0x01;
			if(styleFlagsHasFont)
			{
				fontId = bt.readUnsignedShort();
			}
			if(styleFlagsHasColor)
			{
				if(level < 2)
				{
					textColor = new RGB(bt);
				}
				else
				{
					textColor = new RGBA(bt);
				}
			}
			if(styleFlagsHasXOffset)
			{
				xOffset = bt.readSI16();
			}
			if(styleFlagsHasYOffset)
			{
				yOffset = bt.readSI16();
			}
			if(styleFlagsHasFont)
			{
				textHeight = bt.readUnsignedShort();
			}
			glyphCount = bt.readUnsignedByte();
			var glyphEntry:GlyphEntry;
			for(var i:uint=0; i<glyphCount; i++)
			{
				glyphEntry = new GlyphEntry();
				glyphEntry.glyphBits = glyphBits;
				glyphEntry.advanceBits = advanceBits;
				glyphEntry.read( bt );
				glyphEntries.push( glyphEntry );
			}
		}
		
		public function getText():String
		{
			return "";
		}
		
	}
}