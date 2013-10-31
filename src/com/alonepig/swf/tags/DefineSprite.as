package com.alonepig.swf.tags
{
	import com.alonepig.utils.TagTypes;
	
	import flash.utils.ByteArray;

	/**
	 * type = 39 
	 * 
	 */	
	public class DefineSprite extends Tag
	{
		public var frameCount:uint;
		
		public var characterid:uint;
		
		public var tags:Vector.<Tag>;
		
		public function DefineSprite()
		{
			tags = new Vector.<Tag>();
		}
		
		override public function parse():void {
			characterid = bt.readUnsignedShort();
			frameCount = bt.readUnsignedShort();
			var tagType:uint;
			var tagLength:uint;
			var tag:Tag;
			var TagClass:Class;
			while(bt.bytesAvailable > 0)
			{
				tagType = readTagType(bt);
				tagLength = readTagLength(bt);
				
				TagClass = TagTypes.getTagClassByTagType(tagType);
				if (TagClass == null){
					TagClass = Tag;
				}
				tag = new TagClass();
				tag.tagType = tagType;
				tag.tagLength = tagLength;
				if(tag.tagLength < 0 || bt.position + tag.tagLength > bt.length){
					trace("error tag length:" + tag.tagLength);
					continue;
				}
				if( tagLength > 0){
					if(TagClass != Tag)
					{
						bt.readBytes(tag.bt, 0, tagLength);
						tag.parse();
					}
					else
					{
						bt.position += tagLength;
					}
				}
				tags.push( tag );
				if (tagType == TagTypes.TAG_END){
					break;
				}
			}
		}
		
		override public function toXML():XML
		{
			var xml:XML = <DefineSprite />;
			xml.@type = tagType;
			xml.@characterid = characterid;
			xml.@frameCount = frameCount;
			for(var i:int=0; i<tags.length; i++)
			{
				xml.appendChild( tags[i].toXML() );
			}
			return xml;
		}
		
		private function readTagType(bytes:ByteArray):uint
		{
			var result:uint = bytes.readUnsignedShort();
			result = result >> 6;
			bytes.position -= 2;
			return result;
		}
		
		private function readTagLength(bytes:ByteArray):uint
		{
			var taglength:uint = bytes.readUnsignedShort() & 0x3F;
			if(taglength == 0x3F)
			{
				// 如果都为1，则为长类型，后面的四个字节为该类型的长度
				//否则为短类型，该字节的后6位为长度
				taglength = bytes.readUnsignedInt();
			}
			if(taglength < 0)
			{
				throw Error("无效的tag长度");
			}
			return taglength;
		}
		
	}
}