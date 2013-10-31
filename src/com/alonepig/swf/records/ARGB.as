package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	
	public class ARGB extends BaseData
	{
		public var alpha:int;
		public var red:int;
		public var green:int;
		public var blue:int;
		
		public function ARGB(bt:SWFData=null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			alpha = bt.readUI8();
			red = bt.readUI8();
			green = bt.readUI8();
			blue = bt.readUI8();
		}
		
		public function getColor():int
		{
			var color:int = alpha << 16;
			color |= red << 8;
			color |= green;
			color |=  blue<< 24;
			return color;
		}
		
		override public function toString():String
		{
			return  "alpha:" + alpha + ",red:" + red + ",green:" + green + ",blue:" + blue;
		}
	}
}