package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.utils.Tools;
	
	public class LineStyle2 extends LineStyle
	{
		
		public var startCapStyle:int;
		public var endCapsStyle:uint;
		public var jointStyle:uint;
		public var hasFillFlag:uint;
		public var noHScaleFlag:uint;
		public var noVScaleFlag:uint;
		public var pixelHintingFlag:uint;
		public var noClose:uint;
		public var miterLimitFactor:Number = 3;
		public var fillType:FillStyle;
		
		
		public function LineStyle2(bt:SWFData=null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			width = bt.readUnsignedShort();
			var start:int = bt.position*8;
			startCapStyle = Tools.readUBits(bt, start, 2);
			jointStyle = Tools.readUBits(bt, start+2, 2);
			hasFillFlag = Tools.readUBits(bt, start+4, 1);
			noHScaleFlag = Tools.readUBits(bt, start+5, 1);
			noVScaleFlag = Tools.readUBits(bt, start+6, 1);
			pixelHintingFlag = Tools.readUBits(bt, start+7, 1);
			Tools.readUBits(bt, start+8, 5);
			noClose = Tools.readUBits(bt, start+13, 1); 
			endCapsStyle = Tools.readUBits(bt, start+14, 2);
			if(jointStyle == 2)
			{
				miterLimitFactor = bt.readFIXED8();
			}
			if(hasFillFlag)
			{
				fillType = new FillStyle();
				fillStyle.shapeType = shapeType;
				fillStyle.read(bt);
			}
			else
				color = new RGBA(bt).getColor();
		}
		
		override public function toXML():XML
		{
			var xml:XML = <LineStyle2 />;
			xml.@width = width;
			xml.@color = "0x"+color.toString(16);
			return xml;
		}
	}
}