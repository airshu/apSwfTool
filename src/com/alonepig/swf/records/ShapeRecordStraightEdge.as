package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	
	public class ShapeRecordStraightEdge extends ShapeRecord
	{
		public var generalLineFlag:Boolean;
		public var vertLineFlag:Boolean;
		public var deltaY:int;
		public var deltaX:int;
		
		
		public function ShapeRecordStraightEdge(bt:SWFData=null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			generalLineFlag = (bt.readUB(1) == 1);
			vertLineFlag = !generalLineFlag ? (bt.readUB(1) == 1) : false;
			deltaX = (generalLineFlag || !vertLineFlag) ? bt.readSB(numBits) : 0;
			deltaY = (generalLineFlag || vertLineFlag) ? bt.readSB(numBits) : 0;
			
		}
	}
}