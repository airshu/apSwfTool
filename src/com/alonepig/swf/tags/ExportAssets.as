package com.alonepig.swf.tags
{
	import com.alonepig.swf.records.Symbol;

	/**
	 * type = 56 
	 * 使部分文件能被其他swf导入 
	 */	
	public class ExportAssets extends Tag
	{
		
		public var count:uint;
		
		public var symbols:Vector.<Symbol>;
		
		public function ExportAssets()
		{
			super();
		}
		
		override public function parse():void
		{
			symbols = new Vector.<Symbol>();
			count = bt.readUI16();
			for (var i:uint = 0; i < count; i++) 
			{
				symbols.push(new Symbol(bt));
			}
		}
		
		override public function toXML():XML
		{
			var xml:XML = <ExportAssets />;
			xml.@type = tagType;
			for(var i:uint=0; i<symbols.length; i++)
			{
				xml.appendChild( symbols[i].toXML() );
			}
			
			return xml;
		}
	}
}