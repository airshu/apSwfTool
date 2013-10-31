package com.alonepig.swf.tags
{
	import com.alonepig.swf.records.Rect;

	/**
	 * type = 78 
	 * 包含9宫格的概念
	 */	
	public class DefineScalingGrid extends Tag
	{
		
		public var characterId:uint;
		public var splitter:Rect;
		
		public function DefineScalingGrid()
		{
			super();
		}
		
		override public function parse():void
		{
			characterId = bt.readUI16();
			splitter = new Rect(bt);
			
		}
		
		override public function toXML():XML
		{
			var xml:XML = <DefineScalingGrid />;
			xml.@type = tagType;
			xml.@length = tagLength;
			xml.@characterId = characterId;
			xml.@splitter = splitter.toString();
			return xml;
		}
	}
}