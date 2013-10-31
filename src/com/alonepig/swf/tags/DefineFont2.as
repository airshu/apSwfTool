package com.alonepig.swf.tags
{
	import com.alonepig.swf.records.KerningRecord;
	import com.alonepig.swf.records.Rect;
	import com.alonepig.swf.records.Shape;
	
	import flash.utils.ByteArray;

	/**
	 * type = 48 
	 * 
	 */	
	public class DefineFont2 extends DefineFont
	{
		
		public var fontFlagsHasLayout:uint;
		public var fontFlagsShiftJIS:uint;
		public var fontFlagsSmallText:uint;
		public var fontFlagsANSI:uint;
		public var fontFlagsWideOffsets:uint;
		public var fontFlagsWideCodes:uint;
		public var fontFlagsItalic:uint;
		public var fontFlagsBold:uint;
		public var languageCode:uint;
		public var fontNameLen:uint;
		public var fontName:String;
		public var numGlyphs:uint;
		
		public var codeTableOffset:uint;
		public var codeTable:Vector.<uint>;
		public var fontAscent:int;
		public var fontDescent:int;
		public var fontLeading:int;
		public var fontAdvanceTable:Vector.<uint>;
		public var fontBoundsTable:Vector.<Rect>;
		public var kerningCount:int;
		public var fontKerningTable:Vector.<KerningRecord>;
		
		
		public function DefineFont2()
		{
			codeTable = new Vector.<uint>();
			fontAdvanceTable = new Vector.<uint>();
			fontBoundsTable = new Vector.<Rect>();
			fontKerningTable = new Vector.<KerningRecord>();
			super();
		}
		
		override public function parse():void
		{
			//TODO
			return;
			fontId = bt.readUnsignedShort();
			var flags:uint = bt.readUnsignedByte();
			fontFlagsHasLayout = flags & 0x80;
			fontFlagsShiftJIS = flags & 0x40;
			fontFlagsSmallText = flags & 0x20;
			fontFlagsANSI = flags & 0x10;
			fontFlagsWideOffsets = flags & 0x08;
			fontFlagsWideCodes = flags & 0x04;
			fontFlagsItalic = flags & 0x02;
			fontFlagsBold = flags & 0x01;
			languageCode = bt.readUnsignedByte();
			fontNameLen = bt.readUnsignedByte();
			var fontNameRaw:ByteArray = new ByteArray();
			bt.readBytes(fontNameRaw, 0, fontNameLen);
			fontName = fontNameRaw.readUTFBytes(fontNameLen);
			
			numGlyphs = bt.readUnsignedShort();
			bt.position = numGlyphs << (fontFlagsWideOffsets? 2 : 1);
			
			codeTableOffset = fontFlagsWideOffsets ? bt.readUnsignedInt() : bt.readUnsignedShort();
			var i:int;
			var shape:Shape;
			for (i = 0; i < numGlyphs; i++) 
			{
				shape = new Shape(bt);
				glyphShapeTable.push( shape );
			}
			for (i = 0; i < numGlyphs; i++) 
			{
				codeTable.push( fontFlagsWideCodes ? bt.readUnsignedShort() : bt.readUnsignedByte() );
			}
			if(fontFlagsHasLayout)
			{
				fontAscent = bt.readSI16();
				fontDescent = bt.readSI16();
				fontLeading = bt.readSI16();
				for(i=0; i<numGlyphs; i++)
				{
					fontAdvanceTable.push( bt.readSI16() );
				}
				for(i=0; i<numGlyphs; i++)
				{
					fontBoundsTable.push( new Rect(bt) );
				}
				kerningCount = bt.readUnsignedShort();
				var kerningRecord:KerningRecord;
				for(i=0; i<kerningCount; i++)
				{
					kerningRecord = new KerningRecord();
					kerningRecord.fontFlagsWideCodes = fontFlagsWideCodes;
					kerningRecord.read(bt);
					fontKerningTable.push( kerningRecord );
				}
			}
		}
		
		override public function toXML():XML
		{
			var xml:XML = <DefineFont2 />;
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
//			for(i=0; i<glyphShapeTable.length; i++)
//				xml.appendChild( glyphShapeTable[i].toxml
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