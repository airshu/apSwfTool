package com.alonepig.swf.tags
{
	import com.alonepig.swf.SWFData;

	/**
	 * type = 0 
	 * 结束标签 
	 */	
	public class End extends Tag
	{
		public function End()
		{
			super();
		}
		
		override public function publish(bt:SWFData):void
		{
			bt.writeTagHeader(tagType, 0);
		}
		
		override public function toXML():XML
		{
			var xml:XML = <End />;
			xml.@type = tagType;
			
			return xml;
		}
	}
}