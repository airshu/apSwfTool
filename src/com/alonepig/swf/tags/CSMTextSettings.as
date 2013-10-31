package com.alonepig.swf.tags
{
	import com.alonepig.utils.Tools;

	/**
	 * type = 74 
	 * 
	 */	
	public class CSMTextSettings extends Tag
	{
		public var textId:uint;
		public var useFlashType:uint;
		public var gridFit:uint;
		/**
		 * UB[3] 始终为0 
		 */		
		public var reserved1:uint;
		
		public var thickness:Number;
		public var sharpness:Number;
		
		/**
		 * UI8 始终为0 
		 */		
		public var reserved2:uint;
		public function CSMTextSettings()
		{
			super();
		}
		
		override public function parse():void
		{
			textId = bt.readUnsignedShort();
			var start:int = bt.position*8;
			useFlashType = Tools.readUBits(bt, start, 2);
			gridFit = Tools.readUBits(bt, start+2, 3);
			reserved1 = Tools.readUBits(bt, start+5, 3);
			thickness = bt.readFIXED();
			sharpness = bt.readFIXED();
			reserved2 = bt.readUnsignedByte();
		}
		
		override public function toXML():XML
		{
			var xml:XML = <CSMTextSettings />;
			xml.@type = tagType;
			xml.@length = tagLength;
			xml.@textId = textId;
			xml.@useFlashType = useFlashType;
			xml.@gridFit = gridFit;
			xml.@thickness = thickness;
			xml.@sharpness = sharpness;
			
			return xml;
		}
		
		
	}
}