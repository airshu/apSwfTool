package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;

	public class RGB extends BaseData
	{
		public var red:int;
		public var green:int;
		public var blue:int;
		
		public function RGB(bt:SWFData = null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			red = bt.readUnsignedByte();
			green = bt.readUnsignedByte();
			blue = bt.readUnsignedByte();
		}
		
		override public function toString():String
		{
			return "red:" + red + ",green:" + green + ",blue:" + blue;
		}
		
		public function getColor():int
		{
			var color:int = red << 16;
			color |= green << 8;
			color |= blue;
			return color;
		}
		
		
	}
}