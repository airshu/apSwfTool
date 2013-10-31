package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	
	import flash.utils.ByteArray;
	
	public class ColorMapData extends BaseData
	{
		public var colorTableRGB:Vector.<RGB>;
		public var colormapPixelData:*;
		
		
		public var bitmapColorTableSize:uint;
		public var bitmapWidth:uint;
		public var bitmapHeight:uint;
		
		public function ColorMapData(bt:SWFData=null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			
			colorTableRGB = new Vector.<RGB>();
			for (var i:int = 0; i < bitmapColorTableSize+1; i++) 
			{
				colorTableRGB.push( new RGB(bt) );
			}
			
			colormapPixelData = new ByteArray();
			
			var dataLen:int = 0;
			for (var y:int = 0; y < bitmapHeight; y++) {
				var x:int = 0;
				for (; x < bitmapWidth; x++) 
				{
					dataLen++;
				}
				while ((x % 4) != 0) {
					dataLen++;
					x++;
				}
			}
			bt.readBytes( colormapPixelData, 0, dataLen );
			return;	
			for (var j:int = 0; j < bitmapWidth*bitmapHeight; j++) 
			{
				colormapPixelData.push( bt.readUI8() );
			}
			
		}
	}
}