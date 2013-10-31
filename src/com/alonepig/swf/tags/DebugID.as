package com.alonepig.swf.tags
{
	import com.alonepig.utils.StringUtils;

	/**
	 * type = 63 
	 * doc 上没有
	 */	
	public class DebugID extends Tag
	{
		public var uuid:String="";
		
		public function DebugID()
		{
			super();
		}
		
		override public function parse():void
		{
//			uuid = DString.read(bt);
			
			if (bt.length == 16) 
			{
				uuid += StringUtils.printf("%02x%02x%02x%02x-", bt[0], bt[1], bt[2], bt[3]);
				uuid += StringUtils.printf("%02x%02x-", bt[4], bt[5]);
				uuid += StringUtils.printf("%02x%02x-", bt[6], bt[7]);
				uuid += StringUtils.printf("%02x%02x-", bt[8], bt[9]);
				uuid += StringUtils.printf("%02x%02x%02x%02x%02x%02x", bt[10], bt[11], bt[12], bt[13], bt[14], bt[15]);
			} else {
				uuid += "(invalid length: " + bt.length + ")";
			}
		}
		
		override public function toXML():XML
		{
			var xml:XML = <DebugID />;
			xml.@type = tagType;
			xml.@uuid = uuid;
			
			return xml;
		}
		
	}
}