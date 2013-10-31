package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	
	public class RGBA extends BaseData
	{
		public var red:int;
		public var green:int;
		public var blue:int;
		public var alpha:int;
		
		public function RGBA(bt:SWFData=null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			red = bt.readUnsignedByte();
			green = bt.readUnsignedByte();
			blue = bt.readUnsignedByte();
			alpha = bt.readUnsignedByte();
		}
		
		public function getColor():int
		{
			var color:int = red << 16;
			color |= green << 8;
			color |= blue;
			color |= alpha << 24;
			return color;
		}
		
		override public function toString():String
		{
			return "red:" + red + ",green:" + green + ",blue:" + blue + ",alpha:" + alpha;
		}
		
	}
}