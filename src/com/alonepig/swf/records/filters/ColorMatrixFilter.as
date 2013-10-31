package com.alonepig.swf.records.filters
{
	
	import com.alonepig.swf.SWFData;
	
	public class ColorMatrixFilter extends Filter
	{
		protected var colorMatrix:Vector.<Number>;
		
		public function ColorMatrixFilter(bt:SWFData=null)
		{
			colorMatrix = new Vector.<Number>();
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			for (var i:uint = 0; i < 20; i++) {
				colorMatrix.push(bt.readFloat());
			}
		}
	}
}