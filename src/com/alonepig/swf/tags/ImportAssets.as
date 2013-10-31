package com.alonepig.swf.tags
{
	import com.alonepig.swf.records.Symbol;

	/**
	 * type = 57 
	 *  
	 */	
	public class ImportAssets extends Tag
	{
		public var url:String;
		
		public var count:uint;

		public var symbols:Vector.<Symbol>;
		
		public function ImportAssets()
		{
			symbols = new Vector.<Symbol>();
			super();
		}
		
		override public function parse():void
		{
			url = bt.readString();
			count = bt.readUI16();
			for(var i:int=0; i<count; i++)
			{
				symbols.push( new Symbol(bt) );
			}
		}
		
		override public function toXML():XML
		{
			var xml:XML = <ImportAssets />;
			xml.@type = tagType;
			xml.@length = tagLength;
			xml.@url = url;
			xml.@count = count;
			for(var i:int=0; i<count; i++)
			{
				xml.appendChild( symbols[i].toXML() );
			}
			return xml;
		}
		
	}
}