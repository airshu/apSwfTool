package com.alonepig.swf.tags
{
	import flash.utils.ByteArray;

	/**
	 * type = 19 
	 * 包含音频流
	 */	
	public class SoundStreamBlock extends Tag
	{
		public var streamSoundData:ByteArray;
		
		public function SoundStreamBlock()
		{
			streamSoundData = new ByteArray();				
			super();
		}
		
		override public function parse():void
		{
			if(tagLength>0)
				bt.readBytes(streamSoundData, 0, tagLength);
		}
		
		override public function toXML():XML
		{
			var xml:XML = <SoundStreamBlock />;
			xml.@type = tagType;
			xml.@length = tagLength;
			return xml;
		}
	}
}