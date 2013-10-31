package com.alonepig.swf.tags
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.data.consts.BitmapFormat;
	import com.alonepig.swf.records.BitmapData;
	import com.alonepig.swf.records.ColorMapData;
	
	import flash.display.BitmapData;
	import flash.geom.Rectangle;

	/**
	 * type = 20 
	 * 无损非透明
	 */	
	public class DefineBitsLossless extends Tag
	{
		/**
		 *  色彩类型 参考BitmapFormat
		 */		
		public var bitmapFormat:uint;
		public var bitmapWidth:uint;
		public var bitmapHeight:uint;
		public var bitmapColorTableSize:uint;
		
		protected var _characterId:uint;
		/**
		 * 可能为AlphaColorMapData或AlphaBitmapData 
		 */		
		protected var _zlibBitmapData:*;
		
		
		
		/**
		 * 图片的bitmapdata 用来显示图片
		 */		
		public var bitmapData:flash.display.BitmapData;
		
		public function DefineBitsLossless()
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
				bitmapColorTableSize = bt.readUnsignedByte();
			}
			
			var byte:SWFData = new SWFData();
			bt.readBytes(byte, 0, bt.bytesAvailable);
			byte.uncompress();
			
			bitmapData = new flash.display.BitmapData(bitmapWidth, bitmapHeight);
			var rect:Rectangle = new Rectangle(0, 0, bitmapWidth, bitmapHeight); 
			bitmapData.setPixels(rect, byte);
			
			byte.position = 0;
			
			if(bitmapFormat == BitmapFormat.BIT_8)
			{
				_zlibBitmapData = new ColorMapData();
				_zlibBitmapData.bitmapColorTableSize = bitmapColorTableSize;
				_zlibBitmapData.bitmapWidth = bitmapWidth;
				_zlibBitmapData.bitmapHeight = bitmapHeight;
				_zlibBitmapData.read(byte);
			}
			else if(bitmapFormat == BitmapFormat.BIT_15 || bitmapFormat == BitmapFormat.BIT_24)
			{
				_zlibBitmapData = new com.alonepig.swf.records.BitmapData();
				_zlibBitmapData.bitmapFormat = bitmapFormat;
				_zlibBitmapData.bitmapWidth = bitmapWidth;
				_zlibBitmapData.bitmapHeight = bitmapHeight;
				_zlibBitmapData.read(byte);
			}
			
		}
		
		override public function toXML():XML
		{
			var xml:XML = <DefineBitsLossless />;
			xml.@type = tagType;
			xml.@characterId = characterId;
			xml.@bitmapFormat = bitmapFormat;
			xml.@bitmapWidth = bitmapWidth;
			xml.@bitmapHeight = bitmapHeight;
			
			return xml;
		}
		
		public function get characterId():uint
		{
			return _characterId;
		}

		public function set characterId(value:uint):void
		{
			_characterId = value;
		}

		public function get zlibBitmapData():* 
		{
			return _zlibBitmapData; 
		}
		
		public function getImageFormat():String
		{
			return "png";
		}
	}
}