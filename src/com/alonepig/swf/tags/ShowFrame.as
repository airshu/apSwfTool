package com.alonepig.swf.tags
{
	import com.alonepig.swf.SWFData;

	/**
	 * type = 1 
	 * 通知Flash Player显示显示列表的内容
	 * 有几个ShowFrame就表示有几帧
	 */	
	public class ShowFrame extends Tag
	{
		public function ShowFrame()
		{
			super();
		}
		
		override public function publish(bt:SWFData):void
		{
			bt.writeTagHeader(tagType, 0);
		}
		
		override public function toXML():XML
		{
			var xml:XML = <ShowFrame />;
			xml.@type = tagType;
			
			return xml;
		}
	}
}