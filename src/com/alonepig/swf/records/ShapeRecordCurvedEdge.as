package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	
	public class ShapeRecordCurvedEdge extends ShapeRecord
	{
		public var controlDeltaX:int;
		public var controlDeltaY:int;
		public var anchorDeltaX:int;
		public var anchorDeltaY:int;
		
		public function ShapeRecordCurvedEdge(bt:SWFData=null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			controlDeltaX = bt.readSB(numBits);
			controlDeltaY = bt.readSB(numBits);
			anchorDeltaX = bt.readSB(numBits);
			anchorDeltaY = bt.readSB(numBits);
		}
	}
}