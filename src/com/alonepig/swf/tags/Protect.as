package com.alonepig.swf.tags
{
	/**
	 * type = 24 
	 * 标识文件是否能被导入编辑
	 * 如果tagLength为0 则不能被导入 
	 */	
	public class Protect extends Tag
	{
		public function Protect()
		{
			super();
		}
		
		override public function parse():void
		{
		}
		
		override public function toXML():XML
		{
			var xml:XML = <Protect />;
			xml.@type = tagType;
			xml.@length = tagLength;
			
			return xml;
		}
		
	}
}