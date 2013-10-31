package com.alonepig.swf.tags
{
	import com.alonepig.utils.Tools;

	/**
	 * type = 60 
	 * 
	 */	
	public class DefineVideoStream extends Tag
	{
		public var characterId:uint;
		public var numFrames:uint;
		public var width:uint;
		public var height:uint;
		public var videoFlagsReserved:uint;
		public var videoFlagsDeblocking:uint;
		public var videoFlagsSmoothing:uint;
		public var codecId:uint;
		
		public function DefineVideoStream()
		{
			super();
		}
		
		override public function parse():void
		{
			characterId = bt.readUnsignedShort();
			numFrames = bt.readUnsignedShort();
			width = bt.readUnsignedShort();
			height = bt.readUnsignedShort();
			var start:int = bt.position*8;
			videoFlagsReserved = Tools.readUBits(bt, start, 4);
			videoFlagsDeblocking = Tools.readUBits(bt, start+4, 3);
			videoFlagsSmoothing = Tools.readUBits(bt, start+7, 1); 
			codecId = bt.readUnsignedByte();
		}
		
		override public function toXML():XML
		{
			var xml:XML = <DefineVideoStream />;
			xml.@type = tagType;
			xml.@length = tagLength;
			xml.@characterId = characterId;
			xml.@numFrames = numFrames;
			xml.@width = width;
			xml.@height = height;
			xml.@videoFlagsReserved = videoFlagsReserved;
			xml.@videoFlagsDeblocking = videoFlagsDeblocking;
			xml.@videoFlagsSmoothing = videoFlagsSmoothing;
			xml.@codecId = codecId;
			
			return xml;
		}
		
		
	}
}