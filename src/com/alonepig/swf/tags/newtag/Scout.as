package com.alonepig.swf.tags.newtag
{
	import com.alonepig.swf.tags.Tag;
	
	/**
	 * type = 93
	 * new tag 用于scout调试 
	 * tagLength = 2 刚好为5954 解析成短类型tagType为93
	 * 只要在swf中的MetaData标签后插入该标签即可进行Scout调试
	 * 
	 * 还可以在后面加密码
	 */	
	public class Scout extends Tag
	{
		
		public function Scout()
		{
			super();
		}
		
		override public function parse():void
		{
		}
		
//		override public function write():void
//		{
//			bt.writeShort(93<<6|2);
//		}
	}
}