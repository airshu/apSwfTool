package com.alonepig.swf.tags
{
	import com.alonepig.swf.records.RGB;
	
	/**
	 * type = 9 
	 * 舞台背景颜色
	 */	
	public class SetBackgroundColor extends Tag
	{
		public var backgroundColor:RGB;
		
		public function SetBackgroundColor()
		{
			super();
		}
		
		override public function parse():void
		{
			super.parse();
			
			if(!allowChildParse)
			{
				return;
			}
			backgroundColor = new RGB(bt);
		}
		
		override public function toString():String
		{
			return super.toString() + "\n(SetBackgroundColor).RGB:" + backgroundColor;
		}
		
		override public function toXML():XML
		{
			var xml:XML = <SetBackgroundColor />;
			xml.@type = tagType;
			xml.@backgroundColor = "0x"+backgroundColor.getColor().toString(16);
			
			return xml;
		}
		
	}
}