package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	
	public class Pix24 extends BaseData
	{
		public var pix24Reserved:uint;
		public var pix24Red:uint;
		public var pix24Green:uint;
		public var pix24Blue:uint;
		
		public function Pix24(bt:SWFData=null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			bt.resetBitsPending();
			pix24Reserved = bt.readUB(1);
			pix24Red = bt.readUB(5);
			pix24Green = bt.readUB(5);
			pix24Blue = bt.readUB(5);
		}
	}
}