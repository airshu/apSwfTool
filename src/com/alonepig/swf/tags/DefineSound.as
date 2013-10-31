package com.alonepig.swf.tags
{
	import com.alonepig.utils.Tools;
	
	import flash.utils.ByteArray;

	/**
	 * type = 14 
	 * 包含音频流
	 */	
	public class DefineSound extends Tag
	{
		public static const FORMAT_UNCOMPRESSED_NATIVE_ENDIAN:int = 0;
		public static const FORMAT_ADPCM:int = 1;
		public static const FORMAT_MP3:int = 2;
		public static const FORMAT_UNCOMPRESSED_LITTLE_ENDIAN:int = 3;
		public static const FORMAT_NELLYMOSER16KHZ:int = 4;
		public static const FORMAT_NELLYMOSER8KHZ:int = 5;
		public static const FORMAT_NELLYMOSER:int = 6;
		public static const FORMAT_SPEEX:int = 11;
		
		
		public var soundId:uint;
		public var soundFormat:uint;
		public var soundRate:uint;
		public var soundSize:uint;
		public var soundType:uint;
		public var soundSampleCount:uint;
		public var soundData:ByteArray;
		
		
		public function DefineSound()
		{
			soundData = new ByteArray();
			super();
		}
		
		override public function parse():void
		{
			soundId = bt.readUnsignedShort();
			var start:int = bt.position*8;
			soundFormat = Tools.readUBits(bt, start, 4);
			soundRate = Tools.readUBits(bt, start+4, 2);
			soundSize = Tools.readUBits(bt, start+6, 1);
			soundType = Tools.readUBits(bt, start+7, 1);
			soundSampleCount = bt.readUnsignedInt();
			bt.readBytes(soundData, 0, tagLength-7);
		}
		
		override public function toXML():XML
		{
			var xml:XML = <DefineSound />;
			xml.@type = tagType;
			xml.@length = tagLength;
			xml.@soundId = soundId;
			xml.@soundFormat = soundFormat;
			xml.@soundRate = soundRate;
			xml.@soundSize = soundSize;
			xml.@soundType = soundType;
			xml.@soundSampleCount = soundSampleCount;
			
			return xml;
		}
	}
}