package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.data.consts.BitmapFormat;
	
	public class BitmapData extends BaseData
	{
		public var bitmapPixelData:Vector.<Object>;
		
		public var bitmapFormat:int;
		public var bitmapWidth:uint;
		public var bitmapHeight:uint;
		
		public function BitmapData(bt:SWFData=null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			bitmapPixelData = new Vector.<Object>();
			
			var dataLen:int = 0;
			for (var y:int = 0; y < bitmapHeight; y++) {
				var x:int = 0;
				for (; x < bitmapWidth; x++) {
					if (bitmapFormat == BitmapFormat.BIT_15) {
						dataLen += 2;
						bitmapPixelData.push( new Pix15(bt) );
					}
					if (bitmapFormat == BitmapFormat.BIT_24) {
						dataLen += 4;
						bitmapPixelData.push( new Pix24(bt) );
					}
				}
				while ((dataLen % 4) != 0) {
					dataLen++;
					bt.readUI8();
				}
			}
			
//			var i:int;
//			for (i=0; i < bitmapWidth*bitmapHeight; i++) 
//			{
//				if(bitmapFormat == BitmapFormat.BIT_15)
//					bitmapPixelData.push( new Pix15(bt) );
//				else
//					bitmapPixelData.push( new Pix24(bt) );
//			}
			
		}
		
	}
}