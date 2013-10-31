package com.alonepig.swf.tags
{
	import com.alonepig.swf.records.RGBA;
	import com.alonepig.swf.records.Rect;
	import com.alonepig.utils.DString;

	/**
	 * type = 37 
	 * 
	 */	
	public class DefineEditText extends Tag
	{
		public var characterId:uint;
		public var bounds:Rect;
		public var hasText:uint;
		public var wordWrap:uint;
		public var multiline:uint;
		public var password:uint;
		public var readOnly:uint;
		public var hasTextColor:uint;
		public var hasMaxLength:uint;
		public var hasFont:uint;
		public var hasFontClass:uint;
		public var autoSize:uint;
		public var hasLayout:uint;
		public var noSelect:uint;
		public var border:uint;
		public var wasStatic:uint;
		public var html:uint;
		public var useOutlines:uint;
		public var fontId:uint;
		public var fontClass:String;
		public var fontHeight:uint;
		public var textColor:RGBA;
		public var maxLength:uint;
		public var align:uint;
		public var leftMargin:uint;
		public var rightMargin:uint;
		public var indent:uint;
		public var leading:uint;
		public var variableName:String;
		public var initialText:String;
		
		
		
		public function DefineEditText()
		{
			super();
		}
		
		override public function parse():void
		{
			characterId = bt.readUnsignedShort();
			bounds = new Rect(bt);
			var flags1:uint = bt.readUnsignedByte();
			hasText = flags1 & 0x80;
			wordWrap = flags1 & 0x40;
			multiline = flags1 & 0x20;
			password = flags1 & 0x10;
			readOnly = flags1 & 0x08;
			hasTextColor = flags1 & 0x04;
			hasMaxLength = flags1 & 0x02;
			hasFont = flags1 & 0x01;
			var flags2:uint = bt.readUnsignedByte();
			hasFontClass = flags2 & 0x80;
			autoSize = flags2 & 0x40;
			hasLayout = flags2 & 0x20;
			noSelect = flags2 & 0x10;
			border = flags2 & 0x08;
			wasStatic = flags2 & 0x04;
			html = flags2 & 0x02;
			useOutlines = flags1 & 0x01;
			if(hasFont)
			{
				fontId = bt.readUnsignedShort();
			}
			if(hasFontClass)
			{
				fontClass = DString.read(bt);
			}
			if(hasFont)
			{
				fontHeight = bt.readUnsignedShort();
			}
			if(hasTextColor)
			{
				textColor = new RGBA(bt);
			}
			if(hasMaxLength)
			{
				maxLength = bt.readUnsignedShort();
			}
			if(hasLayout)
			{
				align = bt.readUnsignedByte();
				leftMargin = bt.readUnsignedShort();
				rightMargin = bt.readUnsignedShort();
				indent = bt.readUnsignedShort();
				leading = bt.readUnsignedShort();
			}
			variableName = DString.read(bt);
			if(hasText)
			{
				initialText = DString.read(bt);
			}
		}
		
		override public function toXML():XML
		{
			var xml:XML = <DefineEditText />;
			xml.@type = tagType;
			xml.@length = tagLength;
			xml.@characterId = characterId;
			xml.@bounds = bounds.toString();
			xml.@variableName = variableName;
			xml.@hasText = hasText;
			xml.@wordWrap = wordWrap;
			xml.@multiline = multiline;
			xml.@password = password;
			xml.@readOnly = readOnly;
			xml.@hasTextColor = hasTextColor;
			xml.@hasMaxLength = hasMaxLength;
			xml.@hasFont = hasFont;
			xml.@hasFontClass = hasFontClass;
			xml.@autoSize = autoSize;
			xml.@hasLayout = hasLayout;
			xml.@noSelect = noSelect;
			xml.@border = border;
			xml.@wasStatic = wasStatic;
			xml.@html = html;
			xml.@useOutlines = useOutlines;
			if(hasFont)
			{
				xml.@fontId = fontId;
			}
			if(hasFontClass)
			{
				xml.@fontClass = fontClass;
			}
			if(hasFont)
			{
				xml.@fontHeight = fontHeight;
			}
			if(hasTextColor)
			{
				xml.@textColor = textColor.getColor();
			}
			if(hasMaxLength)
			{
				xml.@maxLength = maxLength;
			}
			if(hasLayout)
			{
				xml.@align = align;
				xml.@leftMargin = leftMargin;
				xml.@rightMargin = rightMargin;
				xml.@indent = indent;
				xml.@leading = leading;
			}
			
			return xml;
		}
		
	}
}