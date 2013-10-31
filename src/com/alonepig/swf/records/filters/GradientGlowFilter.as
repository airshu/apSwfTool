package com.alonepig.swf.records.filters
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.RGBA;
	
	public class GradientGlowFilter extends Filter
	{
		public var numColors:uint;
		public var blurX:Number;
		public var blurY:Number;
		public var strength:Number;
		public var innerShadow:Boolean;
		public var knockout:Boolean;
		public var compositeSource:Boolean;
		public var onTop:Boolean;
		public var passes:uint;
		
		protected var gradientColors:Vector.<uint>;
		protected var gradientRatios:Vector.<uint>;
		
		public function GradientGlowFilter(bt:SWFData=null)
		{
			gradientColors = new Vector.<uint>();
			gradientRatios = new Vector.<uint>();
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			numColors = bt.readUnsignedByte();
			var i:uint;
			for (i = 0; i < numColors; i++) {
				gradientColors.push((new RGBA(bt)).getColor());
			}
			for (i = 0; i < numColors; i++) {
				gradientRatios.push(bt.readUnsignedByte());
			}
			blurX = bt.readFIXED();
			blurY = bt.readFIXED();
			strength = bt.readFIXED8();
			var flags:uint = bt.readUnsignedByte();
			innerShadow = ((flags & 0x80) != 0);
			knockout = ((flags & 0x40) != 0);
			compositeSource = ((flags & 0x20) != 0);
			onTop = ((flags & 0x20) != 0);
			passes = flags & 0x0f;
		}
		
		
	}
}