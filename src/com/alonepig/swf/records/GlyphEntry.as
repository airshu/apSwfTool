package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	
	/**
	 * 
	 */	
	public class GlyphEntry extends BaseData
	{
		public var glyphIndex:uint;
		public var glyhAdvance:int;
		
		public var glyphBits:uint;
		public var advanceBits:uint;
		
		public function GlyphEntry(bt:SWFData=null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			glyphIndex = bt.readUB(glyphBits);
			glyhAdvance = bt.readSB(advanceBits);
		}
	}
}