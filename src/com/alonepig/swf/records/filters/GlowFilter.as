package com.alonepig.swf.records.filters
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.RGBA;
	
	public class GlowFilter extends Filter
	{
		public var glowColor:uint;
		public var blurX:Number;
		public var blurY:Number;
		public var strength:Number;
		public var innerGlow:Boolean;
		public var knockout:Boolean;
		public var compositeSource:Boolean;
		public var passes:uint;
		
		public function GlowFilter(bt:SWFData=null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			glowColor = (new RGBA(bt)).getColor();
			blurX = bt.readFIXED();
			blurY = bt.readFIXED();
			strength = bt.readFIXED8();
			var flags:uint = bt.readUnsignedByte();
			innerGlow = ((flags & 0x80) != 0);
			knockout = ((flags & 0x40) != 0);
			compositeSource = ((flags & 0x20) != 0);
			passes = flags & 0x1f;
		}
	}
}