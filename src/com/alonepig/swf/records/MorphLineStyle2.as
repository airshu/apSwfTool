package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	
	public class MorphLineStyle2 extends MorphLineStyle
	{
		
		public var startCapStyle:int;
		public var joinStyle:int;
		public var hasFillFlag:int;
		public var noHScaleFlag:int;
		public var noVScaleFlag:int;
		public var pixelHintingFlag:int;
		public var reserved:int;
		public var noClose:int;
		public var endCapStyle:int;
		public var miterLimitFactor:int;
		
		public var fillType:MorphFillStyle;
		
		public function MorphLineStyle2(bt:SWFData=null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			startWidth = bt.readUI16();
			endWidth = bt.readUI16();
			startCapStyle = bt.readUB(2);
			joinStyle = bt.readUB(2);
			hasFillFlag = bt.readUB(1);
			
			noHScaleFlag = bt.readUB(1);
			noVScaleFlag = bt.readUB(1);
			pixelHintingFlag = bt.readUB(1);
			reserved = bt.readUB(5);
			noClose = bt.readUB(1);
			endCapStyle = bt.readUB(2);
			
			if(joinStyle == 2)
			{
				miterLimitFactor = bt.readUI16();
			}
			if(hasFillFlag)
			{
				fillType = new MorphFillStyle(bt);
			}
			else
			{
				startColor = new RGBA(bt);
				endColor = new RGBA(bt);
			}
		}
	}
}