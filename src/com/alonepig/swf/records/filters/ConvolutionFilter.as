package com.alonepig.swf.records.filters
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.RGBA;
	
	public class ConvolutionFilter extends Filter
	{
		public var matrixX:uint;
		public var matrixY:uint;
		public var divisor:Number;
		public var bias:Number;
		public var defaultColor:uint;
		public var clamp:Boolean;
		public var preserveAlpha:Boolean;
		
		protected var matrix:Vector.<Number>;
		
		public function ConvolutionFilter(bt:SWFData=null)
		{
			matrix = new Vector.<Number>();
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			matrixX = bt.readUnsignedByte();
			matrixY = bt.readUnsignedByte();
			divisor = bt.readFloat();
			bias = bt.readFloat();
			var len:uint = matrixX * matrixY;
			for (var i:uint = 0; i < len; i++) {
				matrix.push(bt.readFloat());
			}
			defaultColor = (new RGBA(bt)).getColor();
			var flags:uint = bt.readUnsignedByte();
			clamp = ((flags & 0x02) != 0);
			preserveAlpha = ((flags & 0x01) != 0);
		}
	}
}