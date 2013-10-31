package com.alonepig.swf.tags
{
	/**
	 * type = 5 
	 * 移出显示列表上制定的角色
	 */	
	public class RemoveObject extends Tag
	{
		public var characterId:uint;
		public var depth:uint;
		
		public function RemoveObject()
		{
			super();
		}
		
		override public function parse():void
		{
			characterId = bt.readUI16();
			depth = bt.readUI16();
		}
		
		override public function toXML():XML
		{
			var xml:XML = <RemoveObject />;
			xml.@type = tagType;
			xml.@length = tagLength;
			xml.@depth = depth;
			xml.@characterId = characterId;
			
			return xml;
		}
	}
}