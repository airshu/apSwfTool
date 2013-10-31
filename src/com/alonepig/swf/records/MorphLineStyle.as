package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	
	public class MorphLineStyle extends BaseData
	{
		public var startWidth:uint;
		public var endWidth:uint;
		public var startColor:RGBA;
		public var endColor:RGBA;
		
		
		public function MorphLineStyle(bt:SWFData=null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			startWidth = bt.readUI16();
			endWidth = bt.readUI16();
			startColor = new RGBA(bt);
			endColor = new RGBA(bt);
		}
		
	}
}