package com.alonepig.swf.tags
{
	/**
	 * type = 41 
	 * doc 上没有
	 */	
	public class ProductInfo extends Tag
	{
		
		public var productId:uint;
		public var edition:uint;
		public var majorVersion:uint;
		public var minorVersion:uint;
		public var build:Number;
		public var compileDate:Date;
		
		private static const UINT_MAX_CARRY:Number = uint.MAX_VALUE + 1;
		
		public function ProductInfo()
		{
			super();
		}
		
		override public function parse():void
		{
			productId = bt.readUnsignedInt();
			edition = bt.readUnsignedInt();
			majorVersion = bt.readUnsignedByte();
			minorVersion = bt.readUnsignedByte();

			build = bt.readUnsignedInt() + bt.readUnsignedInt()*UINT_MAX_CARRY;
			
			var sec:Number = bt.readUnsignedInt() + bt.readUnsignedInt()*UINT_MAX_CARRY;
			
			compileDate = new Date(sec);
		}
		
		override public function toXML():XML
		{
			var xml:XML = <ProductInfo />;
			xml.@type = tagType;
			xml.@productId = productId;
			xml.@edition = edition;
			xml.@majorVersion = majorVersion;
			xml.@minorVersion = minorVersion;
			xml.@build = build;
			xml.@compileDate = compileDate.toUTCString();
			
			return xml;
		}
		
		
	}
}