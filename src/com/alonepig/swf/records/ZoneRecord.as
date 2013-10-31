package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	
	public class ZoneRecord extends BaseData
	{
		/**
		 * 总是为2 
		 */		
		public var numZoneData:uint;
		
		public var zoneData:Vector.<ZoneData>;
		
		public var reserved:uint;
		public var zoneMaskY:uint;
		public var zoneMaskX:uint;
		
		
		public function ZoneRecord(bt:SWFData=null)
		{
			zoneData = new Vector.<ZoneData>();
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			numZoneData = bt.readUnsignedByte();
			for(var i:uint=0; i<numZoneData; i++)
			{
				zoneData.push(new ZoneData(bt));
			}
			var mask:uint = bt.readUnsignedByte();
			zoneMaskX = mask & 0x01;
			zoneMaskY = mask & 0x02;
		}
		
		override public function toString():String
		{
			var str:String = "zoneMaskY: " + zoneMaskY + ", zoneMaskX: " + zoneMaskX;
			for (var i:uint = 0; i < zoneData.length; i++) {
				str += ", " + i + ": " + zoneData[i].toString();
			}
			return str;
		}
		
			
	}
}