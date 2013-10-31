package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.utils.Tools;
	
	public class CXFormWithAlpha extends CXForm
	{
		public var alphaMultTerm:int;
		public var alphaAddTerm:int;
		
		public function CXFormWithAlpha(bt:SWFData=null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			var start:int = bt.position*8;
			hasAddTerms = Tools.readUBits(bt, start, 1);
			hasMultTerms = Tools.readUBits(bt, start+1, 1);
			nbits = Tools.readUBits(bt, start+2, 4); 
			redMultTerm = 1;
			greenMultTerm = 1;
			blueMultTerm = 1;
			alphaMultTerm = 1;
			if(hasMultTerms)
			{
				redMultTerm = Tools.readSBits(bt, start+6, nbits);
				greenMultTerm = Tools.readSBits(bt, start+6+nbits, nbits);
				blueMultTerm = Tools.readSBits(bt, start+6+nbits*2, nbits);
				alphaMultTerm = Tools.readSBits(bt, start+6+nbits*3, nbits);
				start += 6 + nbits*3;
			}
			redAddTerm = 0;
			greenAddTerm = 0;
			blueAddTerm = 0;
			if(hasAddTerms)
			{
				redAddTerm = Tools.readSBits(bt, start+6, nbits);
				greenAddTerm = Tools.readSBits(bt, start+6+nbits, nbits);
				blueAddTerm = Tools.readSBits(bt, start+6+nbits*2, nbits);
				alphaAddTerm = Tools.readSBits(bt, start+6+nbits*3, nbits);
			}
		}
	}
}