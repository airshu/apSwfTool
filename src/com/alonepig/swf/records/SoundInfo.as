package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	
	public class SoundInfo extends BaseData
	{
		public var syncStop:Boolean;
		public var syncNoMultiple:Boolean;
		public var hasEnvelope:Boolean;
		public var hasLoops:Boolean;
		public var hasOutPoint:Boolean;
		public var hasInPoint:Boolean;
		
		public var inPoint:uint;
		public var outPoint:uint;
		public var loopCount:uint;
		
		public var envelopeRecords:Vector.<SoundEnvelope>;
		public function SoundInfo(bt:SWFData=null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			var flags:uint = bt.readUnsignedByte();
			syncStop = ((flags & 0x20) != 0);
			syncNoMultiple = ((flags & 0x10) != 0);
			hasEnvelope = ((flags & 0x08) != 0);
			hasLoops = ((flags & 0x04) != 0);
			hasOutPoint = ((flags & 0x02) != 0);
			hasInPoint = ((flags & 0x01) != 0);
			if (hasInPoint)
			{
				inPoint = bt.readUnsignedInt();
			}
			if (hasOutPoint) 
			{
				outPoint = bt.readUnsignedInt();
			}
			if (hasLoops)
			{
				loopCount = bt.readUnsignedShort();
			}
			if (hasEnvelope) 
			{
				var envPoints:uint = bt.readUnsignedByte();
				for (var i:uint = 0; i < envPoints; i++) {
					envelopeRecords.push(new SoundEnvelope(bt));
				}
			}
		}
		
		override public function toXML():XML
		{
			var xml:XML = <SoundInfo />;
			xml.@syncStop = syncStop;
			xml.@syncNoMultiple = syncNoMultiple;
			xml.@hasEnvelope = hasEnvelope;
			xml.@hasLoops = hasLoops;
			xml.@hasOutPoint = hasOutPoint;
			xml.@hasInPoint = hasInPoint;
			if (hasInPoint)
			{
				xml.@inPoint = inPoint;
			}
			if (hasOutPoint) 
			{
				xml.@outPoint = outPoint;
			}
			if (hasLoops)
			{
				xml.@loopCount = loopCount;
			}
			if (hasEnvelope) 
			{
				for (var i:uint = 0; i < envelopeRecords.length; i++) 
				{
					xml.appendChild( envelopeRecords[i].toXML() );
				}
			}
			return xml;
		}
	}
}