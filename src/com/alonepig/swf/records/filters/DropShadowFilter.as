package com.alonepig.swf.records.filters
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.RGBA;
	
	public class DropShadowFilter extends Filter
	{
		public var dropShadowColor:uint;
		public var blurX:Number;
		public var blurY:Number;
		public var angle:Number;
		public var distance:Number;
		public var strength:Number;
		public var innerShadow:Boolean;
		public var knockout:Boolean;
		public var compositeSource:Boolean;
		public var passes:uint;
		
		public function DropShadowFilter(bt:SWFData=null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			dropShadowColor = new RGBA(bt).getColor();
			blurX = bt.readFIXED();
			blurY = bt.readFIXED();
			angle = bt.readFIXED();
			distance = bt.readFIXED();
			strength = bt.readFIXED8();
			var flags:uint = bt.readUnsignedByte();
			innerShadow = ((flags & 0x80) != 0);
			knockout = ((flags & 0x40) != 0);
			compositeSource = ((flags & 0x20) != 0);
			passes = flags & 0x1f;
		}
		
		
	}
}