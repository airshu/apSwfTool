package com.alonepig.swf.tags
{
	import com.alonepig.swf.data.consts.CSMTableHint;
	import com.alonepig.swf.records.ZoneRecord;

	/**
	 * type = 73 
	 * 
	 */	
	public class DefineFontAlignZones extends Tag
	{
		public var fontId:uint;
		public var csmTableHint:uint;
		public var reserved:uint;
		public var zoneTable:Vector.<ZoneRecord>;
		
		public function DefineFontAlignZones()
		{
			zoneTable = new Vector.<ZoneRecord>();
			super();
		}
		
		override public function parse():void
		{
			fontId = bt.readUnsignedShort();
			csmTableHint = bt.readUnsignedByte() >> 6;
			var recordsEndPos:uint = bt.position + tagLength - 3;
			while(bt.position<recordsEndPos)
			{
				zoneTable.push( new ZoneRecord(bt) );
			}
		}
		
		override public function toXML():XML
		{
			var xml:XML = <DefineFontAlignZones />;
			xml.@type = tagType;
			xml.@length = tagLength;
			xml.@fontId = fontId;
			xml.@cmsTableHint = CSMTableHint.toString(csmTableHint);
			
			
			
			return xml;
		}
		
	}
}