package com.alonepig.swf.tags
{
	/**
	 * type = 2 
	 * 
	 */	
	public class DefineShape2 extends DefineShape
	{
		public function DefineShape2()
		{
			super();
		}
		
		override public function toXML():XML
		{
			var xml:XML = <DefineShape2 />;
			xml.@type = tagType;
			xml.@shapeId = shapeId;
			xml.@rect = shapeBounds.toString();
			xml.appendChild( shapes.toXML() );
			return xml;
		}
	
		override public function get level():uint 
		{ 
			return 2; 
		}
		
	}
}