package com.alonepig.swf.tags
{
	import com.alonepig.swf.records.Symbol;
	import com.alonepig.utils.DString;

	/**
	 * type = 71 
	 * 
	 */	
	public class ImportAssets2 extends ImportAssets
	{
		public function ImportAssets2()
		{
			super();
		}
		
		override public function parse():void
		{
			url = DString.read(bt);
			bt.readUnsignedByte();
			bt.readUnsignedByte();// reserved
			count = bt.readUnsignedShort();
			for(var i:int=0; i<count; i++)
			{
				symbols.push( new Symbol(bt) );
			}
		}
		
		override public function toXML():XML
		{
			var xml:XML = <ImportAssets2 />;
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