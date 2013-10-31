package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	
	public class AlphaBitmapData extends BaseData
	{
		public var bitmapPixelData:Vector.<ARGB>;
		
		
		public var bitmapWidth:uint;
		public var bitmapHeight:uint;
		
		
		public function AlphaBitmapData(bt:SWFData=null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			bitmapPixelData = new Vector.<ARGB>();
			for (var i:int = 0; i < bitmapWidth*bitmapHeight; i++) 
			{
				bitmapPixelData.push( new ARGB(bt) );
			}
			
			
		}
	}
}