package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	
	public class MorphFillStyle extends BaseData
	{
		public var type:uint;
		
		public var startColor:uint;
		public var endColor:uint;
		public var startGradientMatrix:Matrix;
		public var endGradientMatrix:Matrix;
		public var gradient:Gradient;
		public var bitmapId:uint;
		public var startBitmapMatrix:Matrix;
		public var endBitmapMatrix:Matrix;
		
		public function MorphFillStyle(bt:SWFData=null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			type = bt.readUnsignedByte();
			switch(type)
			{
				case 0x00:
					startColor = (new RGBA(bt)).getColor();
					endColor = (new RGBA(bt)).getColor();
					break;
				case 0x10:
				case 0x12:
					startGradientMatrix = new Matrix(bt);
					endGradientMatrix = new Matrix(bt);
					gradient = new Gradient(bt);
					break;
				case 0x40:
				case 0x41:
				case 0x42:
				case 0x43:
					bitmapId = bt.readUnsignedShort();
					startBitmapMatrix = new Matrix(bt);
					endBitmapMatrix = new Matrix(bt);
					break;
				default:
					throw(new Error("Unknown fill style type: 0x" + type.toString(16)));
			}
		}
		
		
	}
}