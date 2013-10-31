package com.alonepig.swf.tags
{
	import com.alonepig.swf.records.Rect;
	import com.alonepig.swf.records.ShapeWithStyle;
	

	/**
	 * type = 83 
	 * 
	 */	
	public class DefineShape4 extends DefineShape3
	{
		public var edgeBounds:Rect;
		public var reserved:uint;
		public var usesFillWindingRule:uint;
		public var usesNonScalingStrokes:uint;
		public var usesScalingStrokes:uint;
		
		public function DefineShape4()
		{
			super();
		}
		
		override public function parse():void
		{
			
			if(!allowChildParse)
				return;
			
			shapeId = bt.readUnsignedShort();
			shapeBounds = new Rect(bt);
			edgeBounds = new Rect(bt);
			var flags:uint = bt.readUI8();
			usesFillWindingRule = (flags & 0x04) > 0 ? 1 : 0;
			usesNonScalingStrokes = (flags & 0x02) > 0 ? 1 : 0;
			usesScalingStrokes = (flags & 0x01) > 0 ? 1 : 0;
			
//			var start:int = bt.position*8;
//			reserved = Tools.readUBits(bt, start, 5);
//			usesFillWindingRule = Tools.readUBits(bt, start + 5, 1);
//			usesNonScalingStrokes = Tools.readUBits(bt, start + 6, 1);
//			usesScalingStrokes = Tools.readUBits(bt, start + 7, 1);
			
			shapes = new ShapeWithStyle();
			shapes.shapeType = level;
			shapes.read(bt);
		}
		
		override public function get level():uint { return 4; }
		
		
		override public function toString():String
		{
			return super.toString() + "\n (DefineShape4)ShapeId:" + shapeId
				+ "\n ShapeBounds:" + shapeBounds.toString()
				+ "\n EdgeBounds:" + edgeBounds.toString()
				+ "\n Reserved:" + reserved
				+ "\n UsesFillWindingRule:" + usesFillWindingRule
				+ "\n UsesNonScalingStrokes:" + usesNonScalingStrokes
				+ "\n UsesScalingStrokes:" + usesScalingStrokes
				+ "\n Shapes:" + shapes;
		}
		
		override public function toXML():XML
		{
			var xml:XML = <DefineShape4 />;
			xml.@type = tagType;
			xml.@shapeId = shapeId;
			xml.@shapeBounds = shapeBounds.toString();
			xml.@edgeBounds = edgeBounds.toString();
			xml.@usesFillWindingRule = usesFillWindingRule;
			xml.@usesNonScalingStrokes = usesNonScalingStrokes;
			xml.@usesScalingStrokes = usesScalingStrokes;
			xml.appendChild( shapes.toXML() );
			
			return xml;
		}
	}
}