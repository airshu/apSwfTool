package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	
	public class Pix15 extends BaseData
	{
		public var pix15Reserved:uint;
		public var pix15Red:uint;
		public var pix15Green:uint;
		public var pix15Blue:uint;
		
		public function Pix15(bt:SWFData=null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			bt.resetBitsPending();
			pix15Reserved = bt.readUB(1);
			pix15Red = bt.readUB(5);
			pix15Green = bt.readUB(5);
			pix15Blue = bt.readUB(5);
		}
	}
}