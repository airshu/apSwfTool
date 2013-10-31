package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	
	public class ShapeRecordStyleChange extends ShapeRecord
	{
		
		public var stateNewStyles:Boolean = false;
		public var stateLineStyle:Boolean = false;
		public var stateFillStyle1:Boolean = false;
		public var stateFillStyle0:Boolean = false;
		public var stateMoveTo:Boolean = false;
		
		public var moveDeltaX:int = 0;
		public var moveDeltaY:int = 0;
		public var fillStyle0:uint = 0;
		public var fillStyle1:uint = 0;
		public var lineStyle:uint = 0;
		
		public var numFillBits:uint = 0;
		public var numLineBits:uint = 0;
		
		protected var fillStyles:Vector.<FillStyle>;
		protected var lineStyles:Vector.<LineStyle>;
		
		public function ShapeRecordStyleChange(bt:SWFData=null)
		{
			fillStyles = new Vector.<FillStyle>();
			lineStyles = new Vector.<LineStyle>();
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			if (stateMoveTo)
			{
				var moveBits:uint = bt.readUB(5);
				moveDeltaX = bt.readSB(moveBits);
				moveDeltaY = bt.readSB(moveBits);
			}
			fillStyle0 = stateFillStyle0 ? bt.readUB(numFillBits) : 0;
			fillStyle1 = stateFillStyle1 ? bt.readUB(numFillBits) : 0;
			lineStyle = stateLineStyle ? bt.readUB(numLineBits) : 0;
			if (stateNewStyles) 
			{
				bt.resetBitsPending();
				var i:uint;
				var fillStylesLen:uint = readStyleArrayLength(bt, shapeType);
				var fillStyle:FillStyle;
				for (i = 0; i < fillStylesLen; i++) 
				{
					fillStyle = new FillStyle();
					fillStyle.shapeType = shapeType;
					fillStyle.read(bt);
					fillStyles.push(fillStyle);
				}
				var lineStylesLen:uint = readStyleArrayLength(bt, shapeType);
				var lineStyle:LineStyle;
				for (i = 0; i < lineStylesLen; i++) 
				{
					if(shapeType<=3)
					{
						lineStyle = new LineStyle();
						lineStyle.shapeType = shapeType;
						lineStyle.read(bt);
					}
					else
					{
						lineStyle = new LineStyle2();
						lineStyle.shapeType = shapeType;
						lineStyle.read(bt);
					}
					lineStyles.push(lineStyle);
				}
				numFillBits = bt.readUB(4);
				numLineBits = bt.readUB(4);
			}
		}
		
		protected function readStyleArrayLength(data:SWFData, level:uint = 1):uint
		{
			var len:uint = data.readUI8();
			if (level >= 2 && len == 0xff) 
			{
				len = data.readUI16();
			}
			return len;
		}
	}
}