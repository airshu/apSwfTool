package com.alonepig.swf.records.filters
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.RGBA;
	
	public class BevelFilter extends Filter
	{
		public var shadowColor:uint;
		public var highlightColor:uint;
		public var blurX:Number;
		public var blurY:Number;
		public var angle:Number;
		public var distance:Number;
		public var strength:Number;
		public var innerShadow:Boolean;
		public var knockout:Boolean;
		public var compositeSource:Boolean;
		public var onTop:Boolean;
		public var passes:uint;
		
		public function BevelFilter(bt:SWFData=null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			shadowColor = (new RGBA(bt)).getColor();
			highlightColor = (new RGBA(bt)).getColor();
			blurX = bt.readFIXED();
			blurY = bt.readFIXED();
			angle = bt.readFIXED();
			distance = bt.readFIXED();
			strength = bt.readFIXED8();
			var flags:uint = bt.readUnsignedByte();
			innerShadow = ((flags & 0x80) != 0);
			knockout = ((flags & 0x40) != 0);
			compositeSource = ((flags & 0x20) != 0);
			onTop = ((flags & 0x10) != 0);
			passes = flags & 0x0f;
		}
	}
}