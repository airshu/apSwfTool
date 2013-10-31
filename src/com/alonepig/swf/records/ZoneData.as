package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.utils.Tools;
	
	public class ZoneData extends BaseData
	{
		public var alignmentCoordinate:Number;
		public var range:Number;
		
		public function ZoneData(bt:SWFData=null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			alignmentCoordinate = Tools.readFloat16(bt);
			range = Tools.readFloat16(bt);
		}
		
		
	}
}