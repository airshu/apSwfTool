package com.alonepig.swf.tags
{
	

	/**
	 * type = 64 
	 * 
	 */	
	public class EnableDebugger2 extends EnableDebugger
	{
		public var reserved:uint;
		
		public function EnableDebugger2()
		{
			super();
		}
		
		override public function parse():void
		{
			reserved = bt.readUI16();
			password = bt.readString();
		}
		
		override public function toXML():XML
		{
			var xml:XML = <EnableDebugger2 />;
			xml.@type = tagType;
			xml.@length = tagLength;
			xml.@password = password;
			
			return xml;
		}
		
	}
}