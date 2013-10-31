package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.swf.records.filters.Filter;
	
	public class ButtonRecord extends BaseData
	{
		public var hasBlendMode:Boolean = false;
		public var hasFilterList:Boolean = false;
		public var stateHitTest:Boolean;
		public var stateDown:Boolean;
		public var stateOver:Boolean;
		public var stateUp:Boolean;
		
		public var characterId:uint;
		public var placeDepth:uint;
		public var placeMatrix:Matrix;
		public var colorTransform:CXFormWithAlpha;
		public var blendMode:uint;
		
		public var filterList:Vector.<Filter>;
		
		public function ButtonRecord(bt:SWFData=null)
		{
			filterList = new Vector.<Filter>();
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			var flags:uint = bt.readUI8();
			stateHitTest = ((flags & 0x08) != 0);
			stateDown = ((flags & 0x04) != 0);
			stateOver = ((flags & 0x02) != 0);
			stateUp = ((flags & 0x01) != 0);
			characterId = bt.readUI16();
			placeDepth = bt.readUI16();
			placeMatrix = new Matrix(bt);
			if(shapeType >= 2)
			{
				colorTransform = new CXFormWithAlpha(bt);
				hasFilterList = ((flags & 0x10) != 0);
				if(hasFilterList)
				{
					var numberOfFilters:uint = bt.readUI8();
					for (var i:uint = 0; i < numberOfFilters; i++) 
					{
						filterList.push( new FilterList(bt).filter );
					}
				}
				hasBlendMode = ((flags & 0x20) != 0);
				if (hasBlendMode) {
					blendMode = bt.readUI8();
				}
			}
			
			
		}
	}
}