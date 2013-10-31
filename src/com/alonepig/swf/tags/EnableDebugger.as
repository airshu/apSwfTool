package com.alonepig.swf.tags
{
	
	

	/**
	 * type = 58 
	 * 调试标签
	 */	
	public class EnableDebugger extends Tag
	{
		
		public var password:String;
		
		public function EnableDebugger()
		{
			super();
		}
		
		override public function parse():void
		{
			password = bt.readString();
		}
		
		override public function toXML():XML
		{
			var xml:XML = <EnableDebugger />;
			xml.@type = tagType;
			xml.@length = tagLength;
			xml.@password = password;
			
			return xml;
		}
		
	}
}