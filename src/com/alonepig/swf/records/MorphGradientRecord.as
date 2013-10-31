package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	
	public class MorphGradientRecord extends BaseData
	{
		public var startRatio:uint;
		public var startColor:RGBA;
		public var endRatio:uint;
		public var endColor:RGBA;
		
		public function MorphGradientRecord(bt:SWFData=null)
		{
			super(bt);
		}
	}
}