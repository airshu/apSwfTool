package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	
	public class ShapeWithStyle extends Shape
	{
		public var initialFillStyles:Vector.<FillStyle>;
		public var initialLineStyle:Vector.<LineStyle>;
		
		
//		public var fillStyles:FillStyleArray;
//		public var lineStyles:LineStyleArray;
		
		public function ShapeWithStyle(bt:SWFData=null)
		{
			initialFillStyles = new Vector.<FillStyle>();
			initialLineStyle = new Vector.<LineStyle>();
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			bt.resetBitsPending();
			var fillStylesLen:uint = readStyleArrayLength(bt, shapeType);
			var i:int;
			var fillStyle:FillStyle;			
			for(i=0; i<fillStylesLen; i++)
			{
				fillStyle = new FillStyle();
				fillStyle.shapeType = shapeType;
				fillStyle.read(bt);
				initialFillStyles.push( fillStyle ); 
			}
			var lineStylesLen:uint = readStyleArrayLength(bt, shapeType);
			var lineStyle:LineStyle;
			for(i=0; i<lineStylesLen; i++)
			{
				if(shapeType<=3)
				{
					lineStyle = new LineStyle();
					lineStyle.shapeType = shapeType;
					lineStyle.read(bt);
				}
				else
				{
					lineStyle = new LineStyle2();// 只在DefineShape4中使用
					lineStyle.shapeType = shapeType;
					lineStyle.read(bt);
				}
				initialLineStyle.push( lineStyle );
			}
			
			numFillBits = bt.readUB(4);
			numLineBits = bt.readUB(4);
			bt.resetBitsPending();
			readShapeRecords(bt, numFillBits, numLineBits, shapeType);
		}
		
		private function readStyleArrayLength(bt:SWFData, level:uint=1):uint
		{
			var len:uint = bt.readUI8();
			if(level>=2 && len == 0xff)
				len = bt.readUI16();
			return len;
		}
		
		override public function toString():String
		{
			return "ShapeWithStyle:\nfillStyles:" 
				+ "\nnumFillBits:" + numFillBits
				+ "\nnumLineBits:" + numLineBits;
		}
		
		override public function toXML():XML
		{
			var xml:XML = <ShapeWithStyle />;
			xml.@numFillBits = numFillBits;
			xml.@numLineBits = numLineBits;
			var i:int;
			for (i = 0; i < initialFillStyles.length; i++) 
			{
				xml.appendChild( initialFillStyles[i].toXML() );
			}
			for (i = 0; i < initialLineStyle.length; i++) 
			{
				xml.appendChild( initialLineStyle[i].toXML() );
			}
			
			return xml;
		}
		
		
	}
}