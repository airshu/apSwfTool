package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	
	public class SoundEnvelope extends BaseData
	{
		public var pop44:uint;
		public var leftLevel:uint;
		public var rightLevel:uint;
		
		
		public function SoundEnvelope(bt:SWFData=null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			pop44 = bt.readUnsignedInt();
			leftLevel = bt.readUnsignedShort();
			rightLevel = bt.readUnsignedShort();
		}
		
		override public function toXML():XML
		{
			var xml:XML = <SoundEnvelope />;
			xml.@pop44 = pop44;
			xml.@leftLevel= leftLevel;
			xml.@rightLevel = rightLevel;
			return xml;
		}
	}
}