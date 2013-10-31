package com.alonepig.swf.tags
{
	import flash.utils.ByteArray;

	/**
	 * type = 61 
	 * @author lsj
	 * 
	 */	
	public class VideoFrame extends Tag
	{
		public var streamId:uint;
		public var frameNum:uint;
		
		public var videoData:ByteArray;
		
		public function VideoFrame()
		{
			super();
		}
		
		override public function parse():void
		{
			streamId = bt.readUnsignedShort();
			frameNum = bt.readUnsignedShort();
			videoData = new ByteArray();
			bt.readBytes(videoData, 0, tagLength-4);
		}
		
		override public function toXML():XML
		{
			var xml:XML = <VideoFrame />;
			xml.@type = tagType;
			xml.@length = tagLength;
			xml.@streamId = streamId;
			xml.@frameNum = frameNum;
			return xml;
		}
		
	}
}