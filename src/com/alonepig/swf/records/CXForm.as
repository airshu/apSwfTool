package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	
	public class CXForm extends BaseData
	{
		/**
		 * 是否进行加法转换 
		 */		
		public var hasAddTerms:int;
		/**
		 * 是否进行乘法转换 
		 */		
		public var hasMultTerms:int;
		
		public var nbits:int;
		public var redMultTerm:int;
		public var greenMultTerm:int;
		public var blueMultTerm:int;
		
		public var redAddTerm:int;
		public var greenAddTerm:int;
		public var blueAddTerm:int;
		
		public function CXForm(bt:SWFData=null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			bt.resetBitsPending();
			hasAddTerms = bt.readUB(1);
			hasMultTerms = bt.readUB(1);
			nbits = bt.readUB(1); 
			redMultTerm = 1;
			greenMultTerm = 1;
			blueMultTerm = 1;
			if(hasMultTerms)
			{
				redMultTerm = bt.readSB(nbits);
				greenMultTerm = bt.readSB(nbits);
				blueMultTerm = bt.readSB(nbits);
			}
			redAddTerm = 0;
			greenAddTerm = 0;
			blueAddTerm = 0;
			if(hasAddTerms)
			{
				redAddTerm = bt.readSB(nbits);
				greenAddTerm = bt.readSB(nbits);
				blueAddTerm = bt.readSB(nbits);
			}
			
			
			
//			var start:int = bt.position*8;
//			hasAddTerms = Tools.readUBits(bt, start, 1);
//			hasMultTerms = Tools.readUBits(bt, start+1, 1);
//			nbits = Tools.readUBits(bt, start+2, 4); 
//			redMultTerm = 1;
//			greenMultTerm = 1;
//			blueMultTerm = 1;
//			if(hasMultTerms)
//			{
//				redMultTerm = Tools.readSBits(bt, start+6, nbits);
//				greenMultTerm = Tools.readSBits(bt, start+6+nbits, nbits);
//				blueMultTerm = Tools.readSBits(bt, start+6+nbits*2, nbits);
//				start += 6 + nbits*2;
//			}
//			redAddTerm = 0;
//			greenAddTerm = 0;
//			blueAddTerm = 0;
//			if(hasAddTerms)
//			{
//				redAddTerm = Tools.readSBits(bt, start+6, nbits);
//				greenAddTerm = Tools.readSBits(bt, start+6+nbits, nbits);
//				blueAddTerm = Tools.readSBits(bt, start+6+nbits*2, nbits);
//			}
		}
	}
}