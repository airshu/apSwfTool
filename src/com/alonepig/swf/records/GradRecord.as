package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	
	public class GradRecord extends BaseData
	{
		
		public var ratio:uint;
		public var color:uint;
		
		public function GradRecord(bt:SWFData=null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			ratio = bt.readUnsignedByte();
			if(shapeType<=2)
				color = new RGB(bt).getColor();
			else
				color = new RGBA(bt).getColor();
		}
		
		
	}
}