package com.alonepig.swf.tags
{
	/**
	 * type = 28 
	 * 移出指定深度的角色
	 * 只需要知道深度值 就能确定需要移出的角色
	 */	
	public class RemoveObject2 extends RemoveObject
	{
		
		public function RemoveObject2()
		{
			super();
		}
		
		override public function parse():void
		{
			depth = bt.readUnsignedShort();
		}
		
		override public function toXML():XML
		{
			var xml:XML = <RemoveObject2 />;
			xml.@type = tagType;
			xml.@length = tagLength;
			xml.@depth = depth;
			
			return xml;
		}
		
	}
}