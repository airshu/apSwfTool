package com.alonepig.swf.tags
{
	import com.alonepig.swf.records.CXForm;

	/**
	 * type = 23 
	 * 
	 */	
	public class DefineButtonCxform extends Tag
	{
		public var buttonId:uint;
		public var buttonColorTransform:CXForm;
		
		public function DefineButtonCxform()
		{
			super();
		}
		
		override public function parse():void
		{
			buttonId = bt.readUnsignedShort();
			buttonColorTransform = new CXForm(bt);
		}
		
		override public function toXML():XML
		{
			var xml:XML = <DefineButtonCxform />;
			xml.@type = tagType;
			xml.@length = tagLength;
			xml.@buttonId = buttonId;
			return xml;
		}
	}
}