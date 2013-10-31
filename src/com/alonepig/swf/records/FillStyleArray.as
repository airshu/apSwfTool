package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;

	public class FillStyleArray extends BaseData
	{
		public var fillStyleCount:uint;
		public var fillStyleCountExtended:uint;
		public var fillStyles:Vector.<FillStyle>;
		
		public function FillStyleArray(bt:SWFData=null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			fillStyleCount = bt.readUI8();
			if(fillStyleCount == 0xFF)
			{
				fillStyleCountExtended = bt.readUI16();
			}
			fillStyles = new Vector.<FillStyle>();
			for(var i:int=0; i<fillStyleCount; i++)
			{
				var fillStyle:FillStyle = new FillStyle();
				fillStyle.shapeType = shapeType;
				fillStyle.read(bt);
				fillStyles.push( fillStyle );
			}
		}
		
		public function toXML():XML
		{
			var xml:XML = <FillStyleArray />; 
			for(var i:int=0; i<fillStyleCount; i++)
			{
				xml.appendChild( fillStyles[i].toXML() );
			}
			return xml;
		}
		
		
	}
}