package com.alonepig.swf.tags
{
	

	/**
	 * type = 69 
	 * 文件属性
	 */	
	public class FileAttributes extends Tag
	{
		public var reserved:uint;// 一定是0
		public var useDirectBlit:uint;// 使用硬件加速
		public var useGPU:uint;//是否使用GPU
		public var hasMetadata:uint;//是否有元数据
		public var actionScript3:uint;//是否使用AS3
		public var reserved1:uint;//一定为0
		public var useNetwork:uint;//是否能访问网络数据
		public var reserved2:int;//一定为0
		
		
		public function FileAttributes()
		{
		}
		
		
		override public function parse():void
		{
			super.parse();
			
			if(!allowChildParse)
			{
				return;
			}
			var flags:uint = bt.readUI8();
			reserved = flags & 0x80;
			useDirectBlit = ((flags & 0x40) != 0) ? 1 : 0;
			useGPU = ((flags & 0x20) != 0) ? 1 : 0;
			hasMetadata = ((flags & 0x10) != 0) ? 1 : 0;
			actionScript3 = ((flags & 0x08) != 0) ? 1 : 0;
			reserved1 = 0; // 占两位
			useNetwork = ((flags & 0x01) != 0) ? 1 : 0;
			reserved2 = 0; //占24位
			bt.skipBytes(3);
			
//			reserved = Tools.readUBits(bt, 0, 1);
//			useDirectBlit = Tools.readUBits(bt, 1, 1);
//			useGPU = Tools.readUBits(bt, 2, 1);
//			hasMetadata = Tools.readUBits(bt, 3, 1);
//			actionScript3 = Tools.readUBits(bt, 4, 1);
//			reserved1 = Tools.readUBits(bt, 5, 2);
//			useNetwork = Tools.readUBits(bt, 7, 1);
//			reserved2 = Tools.readUBits(bt, 8, 24);
//			bt.position = 4;
		}
		
		override public function toString():String
		{
			return super.toString() 
				+ "\n(FileAttributes)"
				+ "\nreserved：" + reserved 
				+ "\nuseDirectBlit：" + useDirectBlit 
				+ "\nuseGPU：" + useGPU 
				+ "\nhasMetadata：" + hasMetadata 
				+ "\nactionScript3：" + actionScript3 
				+ "\nreserved1：" + reserved1 
				+ "\nuseNetwork：" + useNetwork 
				+ "\nreserved2：" + reserved2;
		}
		
		override public function toXML():XML
		{
			var xml:XML = <FileAttributes />;
			xml.@type = tagType;
			xml.@useDirectBlit = useDirectBlit;
			xml.@useGPU = useGPU;
			xml.@hasMetadata = hasMetadata;
			xml.@actionScript3 = actionScript3;
			xml.@useNetwork = useNetwork;
			
			return xml;
		}
		
	}
}