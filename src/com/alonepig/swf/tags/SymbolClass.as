package com.alonepig.swf.tags
{
	import com.alonepig.swf.records.Symbol;

	/**
	 * type=76  
	 * 创建了swf文件符号和AS3类间的联系
	 * 该标签列出的类能够用在其他swf中
	 */	
	public class SymbolClass extends Tag
	{
		public var numSymbols:uint;
		
		public var symbols:Vector.<Symbol>;
		
		
		public function SymbolClass()
		{
			super();
		}
		
		override public function parse():void
		{
			super.parse();

			if(!allowChildParse)
			{
				return;
			}
			
			numSymbols = bt.readUI16();
			symbols = new Vector.<Symbol>();
			for(var i:uint=0; i<numSymbols; i++)
			{
				symbols.push( new Symbol(bt) );
			}
		}
		
		override public function toXML():XML
		{
			var xml:XML = <SymbolClass />;
			xml.@type = tagType;
			for(var i:int=0; i<symbols.length; i++)
			{
				xml.appendChild( symbols[i].toXML() );
			}
			return xml;
		}
	}
}