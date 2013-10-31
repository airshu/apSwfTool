package com.alonepig.swf.tags
{
	import com.alonepig.swf.data.consts.BitmapType;
	
	import flash.utils.ByteArray;

	/**
	 * type = 6 
	 * 
	 */	
	public class DefineBits extends Tag
	{
		/**
		 * 图片类型 
		 */		
		public var bitmapType:uint = BitmapType.JPEG;
		
		public var characterId:uint;
		public var bitmapData:ByteArray;
		
		public function DefineBits()
		{
			super();
		}
		
		override public function parse():void
		{
			characterId = bt.readUnsignedShort();
			
			if(tagLength > 2)
			{
				bitmapData = new ByteArray();
				bt.readBytes(bitmapData, 0, tagLength - 2);
				trace(bitmapData[0], bitmapData[1]);
				trace("");
			}
			
		}
		
		override public function toXML():XML
		{
			var xml:XML = <DefineBits />;
			xml.@type = tagType;
			xml.@characterId = characterId;
			if(bitmapType ==BitmapType.JPEG)
				xml.@bitmapType = "JPEG";
			else if(bitmapType ==BitmapType.PNG)
				xml.@bitmapType = "PNG";
			else
				xml.@bitmapType = "GIF";
			
			return xml;
		}
		
		/**
		 * 返回图片格式 
		 */		
		public function getImageFormat():String
		{
			if(bitmapType ==BitmapType.JPEG)
				return "jpg";
			else if(bitmapType ==BitmapType.PNG)
				return "png";
			else
				return "gif";
//			if(bitmapData.length>2 && ((bitmapData[0] & 0xff) == 0xff && (bitmapData[1] & 0xff) == 0xd8 )
//			{
//				return "jpg";
//			}
//			if(bitmapData.length>2 && ( (bitmapData[0] & 0xff) == 0x47 && (bitmapData[1] & 0xff) == 0x49 && (bitmapData[2] & 0xff) == 0x46 && (bitmapData[3] & 0xff) == 0x38 && (bitmapData[4] & 0xff) == 0x39 && (bitmapData[5] & 0xff) == 0x61) )
//			{
//				return "gif";
//			}
//			if(bitmapData.length>2 && ( (bitmapData[0] & 0xff) == 0x89 && (bitmapData[1] & 0xff) == 0x50 && (bitmapData[2] & 0xff) == 0x4e && (bitmapData[3] & 0xff) == 0x47 && (bitmapData[4] & 0xff) == 0x0d && (bitmapData[5] & 0xff) == 0x0a && (bitmapData[6] & 0xff) == 0x1a && (bitmapData[7] & 0xff) == 0x0a) )
//			{
//				return "png";
//			}
			
			return "unk";
		}
	}
}