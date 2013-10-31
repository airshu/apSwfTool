package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;

	/**
	 * shape 填充样式 
	 * 可以填充颜色、 渐变、 bitmap
	 */	
	public class FillStyle extends BaseData
	{
//		public var shapeType:uint = TagTypes.TAG_DEFINESHAPE4;// 不同的tag会有不同的格式
		
		public var fillStyleType:uint;
		public var color:*;
		public var gradientMatrix:Matrix;
		public var gradient:Gradient;
		public var bitmapId:int;
		public var bitmapMatrix:Matrix;
		
		
		public function FillStyle(bt:SWFData=null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			fillStyleType = bt.readUnsignedByte();
			if(fillStyleType == 0)
			{
				// shapeType 为DefineShape的level值 
				if(shapeType <= 2)
				{
					color = new RGB(bt);
				}
				else
				{
					color = new RGBA(bt);
				}
			}
			if(fillStyleType == 0x10 || fillStyleType == 0x12 || fillStyleType == 0x13)
			{
				gradientMatrix = new Matrix(bt);
			}
			if(fillStyleType == 0x10 || fillStyleType == 0x12)
			{
				gradient = new Gradient();
				gradient.shapeType = shapeType;
				gradient.read(bt);
			}
			if(fillStyleType == 0x13)
			{
				gradient = new FocalGradient();
				gradient.shapeType = shapeType;
				gradient.read(bt);
			}
			if(fillStyleType == 0x40 || fillStyleType == 0x41 || fillStyleType == 0x42 || fillStyleType == 0x43)
			{
				bitmapId = bt.readUI16();
				bitmapMatrix = new Matrix(bt);
			}
		}
		
		override public function toXML():XML
		{
			var xml:XML = <FillStyle />;
			xml.@fillStyleType = fillStyleType;
			if(color)
				xml.@color = "0x" + color.getColor().toString(16);
			return xml;
		}
		
		
	}
}