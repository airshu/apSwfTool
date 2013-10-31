package com.alonepig.swf.tags
{
	import com.alonepig.swf.data.consts.SoundCompression;
	import com.alonepig.utils.Tools;

	/**
	 * type = 18 
	 * 
	 */	
	public class SoundStreamHead extends Tag
	{
		public var reserved:uint;
		
		public var playbackSoundRate:uint;
		public var playbackSoundSize:uint;
		public var playbackSoundType:uint;
		public var streamSoundCompression:uint;
		public var streamSoundRate:uint;
		public var streamSoundSize:uint;
		public var streamSoundType:uint;
		public var streamSoundSampleCount:uint;
		public var latencySeek:uint;
		
		public function SoundStreamHead()
		{
			super();
		}
		
		override public function parse():void
		{
			var start:int = bt.position*8;
			reserved = Tools.readUBits(bt, start, 4);
			playbackSoundRate = Tools.readUBits(bt, start+4, 2);
			playbackSoundSize = Tools.readUBits(bt, start+6, 1);
			playbackSoundType = Tools.readUBits(bt, start+7, 1);
			streamSoundCompression = Tools.readUBits(bt, start+8, 4);
			streamSoundRate = Tools.readUBits(bt, start+12, 2);
			streamSoundSize = Tools.readUBits(bt, start+14, 1);
			streamSoundType = Tools.readUBits(bt, start+15, 1);
			streamSoundSampleCount = bt.readUnsignedShort();
			if (streamSoundCompression == SoundCompression.MP3) 
			{
				latencySeek = bt.readSI16();
			}
		}
		
		override public function toXML():XML
		{
			var xml:XML = <SoundStreamHead />;
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