package com.alonepig.swf.tags
{
	import com.alonepig.swf.records.MorphFillStyle;
	import com.alonepig.swf.records.MorphLineStyle2;
	import com.alonepig.swf.records.Rect;
	import com.alonepig.swf.records.Shape;
	

	/**
	 * type = 84 
	 * 
	 */	
	public class DefineMorphShape2 extends DefineMorphShape
	{
		
		public var startEdgeBounds:Rect;
		public var endEdgeBounds:Rect;
		public var usesNonScalingStrokes:Boolean;
		public var usesScalingStrokes:Boolean;
		
		public function DefineMorphShape2()
		{
			super();
		}
		
		override public function parse():void
		{
			characterId = bt.readUnsignedShort();
			startBounds = new Rect(bt);
			endBounds = new Rect(bt);
			startEdgeBounds = new Rect(bt);
			endEdgeBounds = new Rect(bt);
			var flags:uint = bt.readUnsignedByte();
			usesNonScalingStrokes = ((flags & 0x02) != 0);
			usesScalingStrokes = ((flags & 0x01) != 0);
			
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
//			return;//  以后完善 TODO
			var morphLineStyle:MorphLineStyle2;
			for(i=0; i<lineStyleCount; i++)
			{
				morphLineStyle = new MorphLineStyle2();
				morphLineStyle.shapeType = 2;
				morphLineStyle.read(bt);
				morphLineStyles.push( morphLineStyle );
			}
			startEdges = new Shape(bt);
			endEdges = new Shape(bt);
		}
		
		override public function toXML():XML
		{
			var xml:XML = <DefineMorphShape2 />;
			xml.@type = tagType;
			xml.@length = tagLength;
			xml.@characterId = characterId;
			xml.@startBounds = startBounds.toString();
			xml.@endBounds = endBounds.toString();
			xml.@startEdgeBounds = startEdgeBounds.toString();
			xml.@endEdgeBounds = endEdgeBounds.toString();
			
			return xml;
		}
		
	}
}