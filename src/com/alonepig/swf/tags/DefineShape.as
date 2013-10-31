package com.alonepig.swf.tags
{
	import com.alonepig.swf.exporters.AS3ShapeExporter;
	import com.alonepig.swf.records.Rect;
	import com.alonepig.swf.records.ShapeWithStyle;

	/**
	 * type = 22 
	 * 
	 */	
	public class DefineShape extends Tag
	{
		/**
		 * 唯一Id 与字典库中的角色对应 
		 */		
		public var shapeId:uint;
		public var shapeBounds:Rect;
		public var shapes:ShapeWithStyle;
		
		public function DefineShape()
		{
			super();
		}
		
		override public function parse():void
		{
			shapeId = bt.readUI16();
			shapeBounds = new Rect(bt);
			
			shapes = new ShapeWithStyle();
			shapes.shapeType = level;
			shapes.read( bt );
		}
		
		override public function toXML():XML
		{
			var xml:XML = <DefineShape />;
			xml.@type = tagType;
			xml.@shapeId = shapeId;
			xml.@rect = shapeBounds.toString();
			xml.appendChild( shapes.toXML() );
			return xml;
		}
		
		public function export(handler:AS3ShapeExporter):void
		{
			shapes.export(handler);
		}
		
		override public function get level():uint
		{
			return 1;
		}
		
	}
}