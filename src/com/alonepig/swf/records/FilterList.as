package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.filters.BevelFilter;
	import com.alonepig.swf.records.filters.BlurFilter;
	import com.alonepig.swf.records.filters.ColorMatrixFilter;
	import com.alonepig.swf.records.filters.ConvolutionFilter;
	import com.alonepig.swf.records.filters.DropShadowFilter;
	import com.alonepig.swf.records.filters.Filter;
	import com.alonepig.swf.records.filters.GlowFilter;
	import com.alonepig.swf.records.filters.GradientBevelFilter;
	import com.alonepig.swf.records.filters.GradientGlowFilter;
	
	public class FilterList extends BaseData
	{
		/**
		 * 滤镜类型 
		 */		
		public var numberOfFilters:uint;
		
		public var filter:Filter;
		
		
		public function FilterList(bt:SWFData=null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			numberOfFilters = bt.readUnsignedByte();
			switch(numberOfFilters)
			{
				case 0:
					filter = new DropShadowFilter(bt);
					break;
				case 1:
					filter = new BlurFilter(bt);
					break;
				case 2:
					filter = new GlowFilter(bt);
					break;
				case 3:
					filter = new BevelFilter(bt);
					break;
				case 4:
					filter = new GradientGlowFilter(bt);
					break;
				case 5:
					filter = new ConvolutionFilter(bt);
					break;
				case 6:
					filter = new ColorMatrixFilter(bt);
					break;
				case 7:
					filter = new GradientBevelFilter(bt);
					break;
			}
		}
	}
}