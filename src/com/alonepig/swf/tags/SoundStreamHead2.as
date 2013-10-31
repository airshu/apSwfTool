package com.alonepig.swf.tags
{
	import com.alonepig.swf.data.consts.SoundCompression;

	/**
	 * type = 45 
	 * 
	 */	
	public class SoundStreamHead2 extends SoundStreamHead
	{
		public function SoundStreamHead2()
		{
			super();
		}
		
		override public function toXML():XML
		{
			var xml:XML = <SoundStreamHead2 />;
			xml.@type = tagType;
			xml.@length = tagLength;
			xml.@playbackSoundRate = playbackSoundRate;
			xml.@playbackSoundSize = playbackSoundSize;
			xml.@playbackSoundType = playbackSoundType;
			xml.@streamSoundCompression = streamSoundCompression;
			xml.@streamSoundRate = streamSoundRate;
			xml.@streamSoundSize = streamSoundSize;
			xml.@streamSoundType = streamSoundType;
			xml.@streamSoundSampleCount = streamSoundSampleCount;
			if (streamSoundCompression == SoundCompression.MP3) 
			{
				xml.@latencySeek = latencySeek;
			}
			return xml;
		}
		
	}
}