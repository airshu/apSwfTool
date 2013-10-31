package com.alonepig.swf.tags
{
	import com.alonepig.swf.records.SoundInfo;
	import com.alonepig.utils.DString;

	/**
	 * type = 89 
	 * 
	 */	
	public class StartSound2 extends Tag
	{
		public var soundClassName:String;
		public var soundInfo:SoundInfo;
		
		public function StartSound2()
		{
			super();
		}
		
		override public function parse():void
		{
			soundClassName = DString.read(bt);
			soundInfo = new SoundInfo(bt);
		}
		
		override public function toXML():XML
		{
			var xml:XML = <StartSound2 />;
			xml.@type = tagType;
			xml.@length = tagLength;
			xml.@soundClassName = soundClassName;
			xml.appendChild( soundInfo.toXML() );
			
			return xml;
		}
	}
}