package com.alonepig.swf.tags
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.data.consts.BitmapFormat;
	import com.alonepig.swf.records.AlphaBitmapData;
	import com.alonepig.swf.records.AlphaColorMapData;
	
	import flash.display.BitmapData;
	import flash.geom.Rectangle;

	/**
	 * type =36 
	 * 无损透明
	 */	
	public class DefineBitsLossless2 extends DefineBitsLossless
	{
		
		public function DefineBitsLossless2()
		{
			super();
		}
		
		override public function parse():void
		{
			_characterId = bt.readUI16();
			bitmapFormat = bt.readUI8();
			bitmapWidth = bt.readUI16();
			bitmapHeight = bt.readUI16();
			if(bitmapFormat == BitmapFormat.BIT_8)
			{
				bitmapColorTableSize = bt.readUI8();
			}
			
			var byte:SWFData = new SWFData();
			bt.readBytes(byte);
			byte.uncompress();
			
			
//			bitmapData = new BitmapData(bitmapWidth, bitmapHeight);
//			var rect:Rectangle = new Rectangle(0, 0, bitmapWidth, bitmapHeight); 
//			bitmapData.setPixels(rect, byte);
			
			byte.position = 0;
			
			
			if(bitmapFormat == BitmapFormat.BIT_8)
			{
				_zlibBitmapData = new AlphaColorMapData();
				_zlibBitmapData.bitmapColorTableSize = bitmapColorTableSize;
				_zlibBitmapData.bitmapWidth = bitmapWidth;
				_zlibBitmapData.bitmapHeight = bitmapHeight;
				_zlibBitmapData.read(byte);
				
			}
			else if(bitmapFormat == BitmapFormat.BIT_15 || bitmapFormat == BitmapFormat.BIT_24)
			{
				_zlibBitmapData = new AlphaBitmapData();
				_zlibBitmapData.bitmapWidth = bitmapWidth;
				_zlibBitmapData.bitmapHeight = bitmapHeight;
				_zlibBitmapData.read(byte);
			}
		}
		
		override public function toXML():XML
		{
			var xml:XML = <DefineBitsLossless2 />;
			xml.@type = tagType;
			xml.@characterId = characterId;
			xml.@bitmapFormat = bitmapFormat;
			xml.@bitmapWidth = bitmapWidth;
			xml.@bitmapHeight = bitmapHeight;
			
			return xml;
		}
	}
}