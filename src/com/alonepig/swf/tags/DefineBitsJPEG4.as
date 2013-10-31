package com.alonepig.swf.tags
{
	import com.alonepig.swf.data.consts.BitmapType;
	

	/**
	 * type = 90 
	 * 
	 */	
	public class DefineBitsJPEG4 extends DefineBitsJPEG3
	{
		public var deblockParam:Number;
		
		
		public function DefineBitsJPEG4()
		{
			super();
		}
		
		override public function parse():void
		{
			characterId = bt.readUnsignedShort();
			var alphaDataOffset:uint = bt.readUnsignedInt();
			deblockParam = bt.readUnsignedShort()/256;
			bt.readBytes( bitmapData, 0, alphaDataOffset);
			if (bitmapData[0] == 0xff && (bitmapData[1] == 0xd8 || bitmapData[1] == 0xd9)) {
				bitmapType = BitmapType.JPEG;
			} else if (bitmapData[0] == 0x89 && bitmapData[1] == 0x50 && bitmapData[2] == 0x4e && bitmapData[3] == 0x47 && bitmapData[4] == 0x0d && bitmapData[5] == 0x0a && bitmapData[6] == 0x1a && bitmapData[7] == 0x0a) {
				bitmapType = BitmapType.PNG;
			} else if (bitmapData[0] == 0x47 && bitmapData[1] == 0x49 && bitmapData[2] == 0x46 && bitmapData[3] == 0x38 && bitmapData[4] == 0x39 && bitmapData[5] == 0x61) {
				bitmapType = BitmapType.GIF89A;
			}
			var alphaDataSize:uint = length - alphaDataOffset - 6;
			if (alphaDataSize > 0) {
				bt.readBytes(bitmapAlphaData, 0, alphaDataSize);
				trace(bitmapAlphaData[0], bitmapAlphaData[1]);
			}
		}
		
		override public function toXML():XML
		{
			var xml:XML = <DefineBitsJPEG4 />;
			xml.@type = tagType;
			xml.@characterId = characterId;
			xml.@deblockParam = deblockParam;
			if(bitmapType ==BitmapType.JPEG)
				xml.@bitmapType = "JPEG";
			else if(bitmapType ==BitmapType.PNG)
				xml.@bitmapType = "PNG";
			else
				xml.@bitmapType = "GIF";
			
			return xml;
		}
		
	}
}