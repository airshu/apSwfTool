package com.alonepig.swf.tags
{
	/**
	 * type = 66 
	 * 
	 */	
	public class SetTabIndex extends Tag
	{
		
		public var depth:uint;
		public var tabIndex:uint;
		
		public function SetTabIndex()
		{
			super();
		}
		
		override public function parse():void
		{
			depth = bt.readUI16();
			tabIndex = bt.readUI16();
		}
		
		override public function toXML():XML
		{
			var xml:XML = <SetTabIndex />;
			xml.@type = tagType;
			xml.@length = tagLength;
			xml.@depth = depth;
			xml.@tabIndex = tabIndex;
			return xml;
		}
		
		
	}
}