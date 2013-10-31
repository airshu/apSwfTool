package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	
	public class AlphaColorMapData extends BaseData
	{
		public var colorTableRGB:Vector.<RGBA>;
		public var colormapPixelData:Vector.<uint>;
		
		
		
		public var bitmapColorTableSize:uint;
		public var bitmapWidth:uint;
		public var bitmapHeight:uint;
		
		public function AlphaColorMapData(bt:SWFData=null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			colorTableRGB = new Vector.<RGBA>();
			for (var i:int = 0; i < bitmapColorTableSize+1; i++) 
			{
				colorTableRGB.push( new RGBA(bt) );
			}
			
			colormapPixelData = new Vector.<uint>();
			var paddedWidth:uint = Math.ceil(bitmapWidth/4) * 4;
			var imageDataSize:uint = paddedWidth * bitmapHeight;
			for (var j:int = 0; j < imageDataSize; j++) 
			{
				colormapPixelData.push( bt.readUI8() );
			}
			
			
			
			
		}
	}
}