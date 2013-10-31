package com.alonepig.swf.records.filters
{
	
	import com.alonepig.swf.SWFData;
	
	public class BlurFilter extends Filter
	{
		public var blurX:Number;
		public var blurY:Number;
		public var passes:uint;
		
		
		public function BlurFilter(bt:SWFData=null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			blurX = bt.readFIXED();
			blurY = bt.readFIXED();
			passes = bt.readUnsignedByte() >> 3;
		}
		
	}
}