package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	
	public class LineStyleArray extends BaseData
	{
		public var lineStyleCount:uint;
		public var lineStyleCountExtended:uint;
		public var lineStyles:Vector.<LineStyle>;
		
		public function LineStyleArray(bt:SWFData=null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			lineStyleCount = bt.readUnsignedByte();
			if(lineStyleCount == 0xFF)
			{
				lineStyleCountExtended = bt.readUnsignedShort(); 
			}
			lineStyles = new Vector.<LineStyle>();
			for(var i:int=0; i<lineStyleCount; i++)
			{
				var lineStyle:LineStyle = new LineStyle();
				lineStyle.shapeType = shapeType;
				lineStyle.read(bt);
				lineStyles.push( lineStyle );
			}
		}
		
		public function toXML():XML
		{
			var xml:XML = <LineStyleArray />; 
			for(var i:int=0; i<lineStyleCount; i++)
			{
				xml.appendChild( lineStyles[i].toXML() );
			}
			return xml;
		}
	}
}