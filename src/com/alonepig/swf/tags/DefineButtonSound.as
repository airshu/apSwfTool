package com.alonepig.swf.tags
{
	import com.alonepig.swf.records.SoundInfo;

	/**
	 * type = 17 
	 * 
	 */	
	public class DefineButtonSound extends Tag
	{
		public var buttonId:uint;
		public var buttonSoundChar0:uint;
		public var buttonSoundChar1:uint;
		public var buttonSoundChar2:uint;
		public var buttonSoundChar3:uint;
		public var buttonSoundInfo0:SoundInfo;
		public var buttonSoundInfo1:SoundInfo;
		public var buttonSoundInfo2:SoundInfo;
		public var buttonSoundInfo3:SoundInfo;
		

		
		public function DefineButtonSound()
		{
			super();
		}
		
		override public function parse():void
		{
			buttonId = bt.readUnsignedShort();
			buttonSoundChar0 = bt.readUnsignedShort();
			if (buttonSoundChar0 != 0)
			{
				buttonSoundInfo0 = new SoundInfo(bt);
			}
			buttonSoundChar1 = bt.readUnsignedShort();
			if (buttonSoundChar1 != 0) 
			{
				buttonSoundInfo1 = new SoundInfo(bt);
			}
			buttonSoundChar2 = bt.readUnsignedShort();
			if (buttonSoundChar2 != 0)
			{
				buttonSoundInfo2 = new SoundInfo(bt);
			}
			buttonSoundChar3 = bt.readUnsignedShort();
			if (buttonSoundChar3 != 0) 
			{
				buttonSoundInfo3 = new SoundInfo(bt);
			}
		}
		
		override public function toXML():XML
		{
			var xml:XML = <DefineButtonSound />;
			xml.@type = tagType;
			xml.@length = tagLength;
			xml.@buttonId = buttonId;
			xml.@buttonSoundChar0 = buttonSoundChar0;
			xml.@buttonSoundChar1 = buttonSoundChar1;
			xml.@buttonSoundChar2 = buttonSoundChar2;
			xml.@buttonSoundChar3 = buttonSoundChar3;
			if (buttonSoundChar0 != 0)
			{
				xml.appendChild( buttonSoundInfo0.toXML() );
			}
			buttonSoundChar1 = bt.readUnsignedShort();
			if (buttonSoundChar1 != 0) 
			{
				xml.appendChild( buttonSoundInfo1.toXML() );
			}
			buttonSoundChar2 = bt.readUnsignedShort();
			if (buttonSoundChar2 != 0)
			{
				xml.appendChild( buttonSoundInfo2.toXML() );
			}
			buttonSoundChar3 = bt.readUnsignedShort();
			if (buttonSoundChar3 != 0) 
			{
				xml.appendChild( buttonSoundInfo3.toXML() );
			}
			
			return xml;
		}
		
	}
}