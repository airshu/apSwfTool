package com.alonepig.swf.tags
{
	

	/**
	 * type = 65 
	 * 
	 */	
	public class ScriptLimits extends Tag
	{
		/**
		 * 最大递归深度 
		 */		
		public var maxRecursionDepth:uint;
		
		/**
		 * 超时 
		 */		
		public var scriptTimeoutSeconds:uint;
		
		public function ScriptLimits()
		{
			super();
		}
		
		override public function parse():void
		{
			maxRecursionDepth = bt.readUnsignedShort();
			scriptTimeoutSeconds = bt.readUnsignedShort();
		}
		
		override public function toXML():XML
		{
			var xml:XML = <ScriptLimits />;
			xml.@type = tagType;
			xml.@maxRecursionDepth = maxRecursionDepth;
			xml.@scriptTimeoutSeconds = scriptTimeoutSeconds;
			
			return xml;
		}
	}
}