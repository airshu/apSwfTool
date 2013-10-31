package com.alonepig.swf.records
{
	
	import com.alonepig.swf.SWFData;
	import com.alonepig.utils.Tools;

	public class Rect extends BaseData
	{
		public var length:uint;
		public var xMinTwips:int;
		public var xMaxTwips:int;
		public var yMinTwips:int;
		public var yMaxTwips:int;
		
		public function Rect(bt:SWFData = null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			bt.resetBitsPending();
			length = bt.readUB(5);
			xMinTwips = bt.readSB(length);
			xMaxTwips = bt.readSB(length);
			yMinTwips = bt.readSB(length);
			yMaxTwips = bt.readSB(length);
			
//			var start:int = bt.position*8;
//			length = Tools.readUBits(bt, start, 5);
//			xMinTwips = Tools.readSBits(bt, start + 5, length);
//			xMaxTwips = Tools.readSBits(bt, start + 5 + length, length);
//			yMinTwips = Tools.readSBits(bt, start + 5 + length * 2, length);
//			yMaxTwips = Tools.readSBits(bt, start + 5 + length * 3, length);
			
		}
		
		public function publish(bt:SWFData):void
		{
			bt.resetBitsPending();
			bt.writeUB(5, length);
			bt.writeSB(length, xMinTwips);
			bt.writeSB(length, xMaxTwips);
			bt.writeSB(length, yMinTwips);
			bt.writeSB(length, yMaxTwips);
		}
		
		override public function toString():String
		{
			var r:Array = [xMinTwips, xMaxTwips, yMinTwips, yMaxTwips];
			return "[" + r + "]";
		}
		
	}
	
}