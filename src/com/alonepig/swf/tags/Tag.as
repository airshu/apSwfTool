package com.alonepig.swf.tags
{
	
	import com.alonepig.swf.SWFData;
	import com.alonepig.utils.TagTypes;
	
	import flash.utils.ByteArray;
	import flash.utils.Endian;

	/**
	 * 标签基类 
	 */	
	public class Tag
	{
		/**
		 * 是否允许子类反序列化
		 */		
		public static var allowChildParse:Boolean = true;
		/**
		 * 是否允许子类序列化
		 */		
		public static var allowChildEncode:Boolean = true;
		/**
		 * 是否允许子类加密
		 */		
		public static var allowChildEncrypt:Boolean = true;
		
		public var bt:SWFData;
		public var tagType:uint;
		public var tagLength:int;
		
		public function Tag()
		{
			bt = new SWFData();
			bt.endian = Endian.LITTLE_ENDIAN;// 一定要设置字节顺序
		}
		
		public function parse():void
		{
			// 所有的bt.position在parse时都是从0开始，不调用也可以
//			bt.position = 0;
		}
		
		public function get tagName():String
		{
			return TagTypes.getTagNameByTagType(tagType);
		}
		
		public function toString():String
		{
			return "@@@@@@@@@@@@@Type:" + tagType + ",Name:" + tagName + ",Length:" + tagLength;
		}
		
		public function toXML():XML
		{
			var xml:XML = new XML("<Tag />");
			xml.@type = tagType;
			return xml;
		}
		
//		public function toXmlString():String
//		{
//			return "";
//		}
		
//		public function getXmlStr():String
//		{
//			return "<node label='tag'/>"
//		}
		
		/**
		 * 改动后的保存tag 
		 * @param bt
		 * 
		 */		
		public function publish(bt:SWFData):void
		{
			
		}
		
		public function encode():void
		{
			var btTmp:ByteArray = new ByteArray();
			btTmp.endian = Endian.LITTLE_ENDIAN;
			btTmp.writeBytes(bt);
			bt.length = 0;
			bt.writeTagHeader(tagType, tagLength);
			bt.writeBytes( btTmp );
			return;
			
//			var btTmp:ByteArray = new ByteArray();
//			btTmp.endian = Endian.LITTLE_ENDIAN;
//			btTmp.writeBytes(bt);
//			var tmpLen:int = btTmp.length;
//			if(tmpLen != tagLength){
//				trace(tagName + ":" + tmpLen + "," + tagLength);
//			}
//			tagLength = tmpLen;
//			bt.length = 0;
//			if(btTmp.length >= 0x3F){
//				bt.writeShort((tagType << 6) | 0x3F);
//				bt.writeUnsignedInt(tagLength);
//			}else{
//				bt.writeShort((tagType << 6) | tagLength);
//			}
//			bt.writeBytes(btTmp);
//			btTmp.length = 0;
		}
		
		public function encrypt():void
		{
			
		}
		
		/**
		 * Tag中的level等于Record中的shapeType 
		 * TODO:  将Record中的shapeType改成level
		 */		
		public function get level():uint 
		{
			return 1;
		}
	}
}