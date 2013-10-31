package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	
	public class MorphGradient extends BaseData
	{
		
		public var numGradients:uint;
		public var gradientRecords:Vector.<MorphGradientRecord>;
		
		public function MorphGradient(bt:SWFData=null)
		{
			super(bt);
		}
	}
}