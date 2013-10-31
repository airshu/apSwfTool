package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	
	public class FocalGradient extends Gradient
	{
		
		public var focalPoint:Number;
		
		public function FocalGradient(bt:SWFData=null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			super.read(bt);
			focalPoint = bt.readFIXED8();
		}
	}
}