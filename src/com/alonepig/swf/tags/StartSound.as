package com.alonepig.swf.tags
{
	import com.alonepig.swf.records.SoundInfo;

	/**
	 * type = 15 
	 * 
	 */	
	public class StartSound extends Tag
	{
		public var soundId:uint;
		public var soundInfo:SoundInfo;
		
		public function StartSound()
		{
			super();
		}
		
		override public function parse():void
		{
			soundId = bt.readUnsignedShort();
			soundInfo = new SoundInfo(bt);
		}
		
		override public function toXML():XML
		{
			var xml:XML = <StartSound />;
			xml.@type = tagType;
			xml.@length = tagLength;
			xml.@soundId = soundId;
			
			return xml;
		}
		
		
	}
}