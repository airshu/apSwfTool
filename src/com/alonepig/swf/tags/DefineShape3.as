package com.alonepig.swf.tags
{
	
	

	/**
	 * type = 32 
	 * 
	 */	
	public class DefineShape3 extends DefineShape2
	{
		
		public function DefineShape3()
		{
			super();
		}
		
		
		override public function toXML():XML
		{
			var xml:XML = <DefineShape3 />;
			xml.@type = tagType;
			xml.@shapeId = shapeId;
			xml.@rect = shapeBounds.toString();
			xml.appendChild( shapes.toXML() );
			return xml;
		}
		
		override public function get level():uint 
		{
			return 3;
		}
		
	}
}