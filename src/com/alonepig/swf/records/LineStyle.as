package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	
	/**
	 * shape 边框样式 
	 * 
	 */
	public class LineStyle extends BaseData
	{
		/**
		 * 厚度 
		 */		
		public var width:uint;
		/**
		 * 边框颜色 
		 */		
		public var color:int;
		
		//shape6 only
		public var flags:int;
		public var miterLimit:int;  // UB[2] iff jointstyle = 2, 8.8 fixedpoint
		public var fillStyle:FillStyle; // if hasFillFlag;
		
		
		
		public function LineStyle(bt:SWFData=null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			width = bt.readUnsignedShort();
			
			if(shapeType <= 2)
				color = new RGB(bt).getColor();
			else
				color = new RGBA(bt).getColor();
			
//			if(shapeType == TagTypes.TAG_DEFINESHAPE4)
//			{
//				flags = bt.readUnsignedShort();
//				if(hasMiterJoint())
//					miterLimit = bt.readUnsignedShort();
//			}
//			if(shapeType == TagTypes.TAG_DEFINESHAPE4 && hasFillStyle())
//			{
//				fillStyle = new FillStyle();
//				fillStyle.shapeType = shapeType;
//				fillStyle.read(bt);
//			}
//			else if(shapeType == TagTypes.TAG_DEFINESHAPE3 || shapeType == TagTypes.TAG_DEFINESHAPE4)
//			{
//				color = new RGBA(bt).getColor();				
//			}
//			else
//			{
//				if(bt.position < bt.length)
//					color = new RGB(bt).getColor();
//			}
		}
		
		public function hasFillStyle():Boolean
		{
			return ((flags & 0x0008) != 0);
		}
		
		public function hasMiterJoint():Boolean
		{
			return ((flags & 0x0030) == 0x0020);
		}
		
		override public function toXML():XML
		{
			var xml:XML = <LineStyle />;
			xml.@width = width;
			xml.@color = "0x"+color.toString(16);
			return xml;
		}
	}
}