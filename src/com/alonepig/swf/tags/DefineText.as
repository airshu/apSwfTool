package com.alonepig.swf.tags
{
	import com.alonepig.swf.records.Matrix;
	import com.alonepig.swf.records.Rect;
	import com.alonepig.swf.records.TextRecord;

	/**
	 * type = 11 
	 * 定义静态文本， 描述字体、大小、颜色等信息
	 * 
	 */	
	public class DefineText extends Tag
	{
		public var characterId:uint;
		public var textBounds:Rect;
		public var textMatrix:Matrix;
		public var glyphBits:uint;
		public var advanceBits:uint;
		public var textRecords:Vector.<TextRecord>;
		public var endOfRecordsFlag:uint;
		
		public function DefineText()
		{
			textRecords = new Vector.<TextRecord>();
			super();
		}
		
		override public function parse():void
		{
			characterId = bt.readUI16();
			textBounds = new Rect(bt);
			textMatrix = new Matrix(bt);
			glyphBits = bt.readUI8();
			advanceBits = bt.readUI8();
			var record:TextRecord;
			while(bt.readUI8()!=0)
			{
				bt.position--;
				record = new TextRecord();
				record.level = level;
				record.advanceBits = advanceBits;
				record.glyphBits = glyphBits;
				record.read(bt);
				textRecords.push( record );
			}
		}
		
		override public function toXML():XML
		{
			var xml:XML = <DefineText />;
			xml.@type = tagType;
			xml.@length = tagLength;
			xml.@characterId = characterId;
//			xml.@textBounds = textBounds.toString();
//			xml.@textMatrix = textMatrix.toString();
			xml.@glyphBits = glyphBits;
			xml.@advanceBits = advanceBits;
			
			return xml;
		}
	}
}