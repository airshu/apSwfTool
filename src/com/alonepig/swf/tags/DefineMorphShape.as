package com.alonepig.swf.tags
{
	import com.alonepig.swf.records.MorphFillStyle;
	import com.alonepig.swf.records.MorphLineStyle;
	import com.alonepig.swf.records.Rect;
	import com.alonepig.swf.records.Shape;

	/**
	 * type = 46 
	 * 
	 */	
	public class DefineMorphShape extends Tag
	{
		public var characterId:uint;
		public var startBounds:Rect;
		public var endBounds:Rect;
		public var offset:int;
		public var morphFillStyles:Vector.<MorphFillStyle>;
		public var morphLineStyles:Vector.<MorphLineStyle>;
		public var startEdges:Shape;
		public var endEdges:Shape;
		
		public function DefineMorphShape()
		{
			morphFillStyles = new Vector.<MorphFillStyle>();
			morphLineStyles = new Vector.<MorphLineStyle>();
			super();
		}
		
		override public function parse():void
		{
			characterId = bt.readUnsignedShort();
			startBounds = new Rect(bt);
			endBounds = new Rect(bt);
			offset = bt.readUnsignedInt();
			var fillStyleCount:uint = bt.readUnsignedByte();
			if(fillStyleCount == 0xff)
			{
				fillStyleCount = bt.readUnsignedShort();
			}
			var i:int;
			for(i=0; i<fillStyleCount; i++)
			{
				morphFillStyles.push( new MorphFillStyle(bt) );
			}
			var lineStyleCount:uint = bt.readUnsignedByte();
			if(lineStyleCount == 0xff)
			{
				lineStyleCount = bt.readUnsignedShort();
			}
//			return;//  以后完善
			for(i=0; i<lineStyleCount; i++)
			{
				morphLineStyles.push( new MorphLineStyle(bt) );
			}
			startEdges = new Shape(bt);
			endEdges = new Shape(bt);
			
		}
		
		override public function toXML():XML
		{
			var xml:XML = <DefineMorphShape />;
			xml.@type = tagType;
			xml.@length = tagLength;
			xml.@characterId = characterId;
			xml.@startBounds = startBounds.toString();
			xml.@endBounds = endBounds.toString();
			
			
			return xml;
		}
		
	}
}