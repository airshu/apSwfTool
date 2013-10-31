package com.alonepig.swf.tags
{
	import com.alonepig.swf.records.CXFormWithAlpha;
	import com.alonepig.swf.records.ClipActions;
	import com.alonepig.swf.records.FilterList;
	import com.alonepig.swf.records.Matrix;

	/**
	 * type =  70
	 * 
	 */	
	public class PlaceObject3 extends PlaceObject2
	{
		
		/**
		 * placeFlagHasImage placeFlagHasClassName都定义的话，表示Bitmap来自当前swf
		 */		
		public var placeFlagHasImage:uint;
		public var placeFlagHasClassName:uint;
		/**
		 * 表示是否在内部缓存显示对象为位图 
		 */		 
		public var placeFlagHasCacheAsBitmap:uint;
		public var placeFlaghasBlendMode:uint;
		public var placeFlagHasFilterList:uint;
		
		public var className:String;
		
		public var surfaceFilterList:Vector.<FilterList>;
		public var blendMode:uint;
		public var bitmapCache:uint;
		
		
		public function PlaceObject3()
		{
			surfaceFilterList = new Vector.<FilterList>();
			super();
		}
		
		override public function parse():void
		{
			if(!allowChildParse)
				return;
			
			return;
			
			var flags1:uint = bt.readUI8();
			placeFlagHasClipActions = (flags1 & 0x80)>0 ? 1 : 0;
			placeFlagHasClipDepth = (flags1 & 0x40)>0 ? 1 : 0;
			placeFlagHasName = (flags1 & 0x20)>0 ? 1 : 0;
			placeFlagHasRatio = (flags1 & 0x10)>0 ? 1 : 0;
			placeFlagHasColorTransform = (flags1 & 0x08)>0 ? 1 : 0;
			placeFlagHasMatrix = (flags1 & 0x04)>0 ? 1 : 0;
			placeFlagHasCharacter = (flags1 & 0x02)>0 ? 1 : 0;
			placeFlagMove = (flags1 & 0x01)>0 ? 1 : 0;
			
			
			var flags2:uint = bt.readUI8();
			placeFlagHasImage = (flags2 & 0x10)>0 ? 1 : 0;
			placeFlagHasClassName = (flags2 & 0x08)>0 ? 1 : 0;
			placeFlagHasCacheAsBitmap = (flags2 & 0x04)>0 ? 1 : 0;
			placeFlaghasBlendMode = (flags2 & 0x02)>0 ? 1 : 0;
			placeFlagHasFilterList = (flags2 & 0x01)>0 ? 1 : 0;
			
//			var start:int = bt.position*8;
//			placeFlagHasClipActions = Tools.readUBits(bt, start, 1);
//			placeFlagHasClipDepth = Tools.readUBits(bt, start+1, 1);
//			placeFlagHasName = Tools.readUBits(bt, start+2, 1);
//			placeFlagHasRatio = Tools.readUBits(bt, start+3, 1);
//			placeFlagHasColorTransform = Tools.readUBits(bt, start+4, 1);
//			placeFlagHasMatrix = Tools.readUBits(bt, start+5, 1);
//			placeFlagHasCharacter = Tools.readUBits(bt, start+6, 1);
//			placeFlagMove = Tools.readUBits(bt, start+7, 1);
			
//			start = bt.position*8;
//			Tools.readUBits(bt, start, 3);
//			placeFlagHasImage = Tools.readUBits(bt, start+3, 1);
//			placeFlagHasClassName = Tools.readUBits(bt, start+4, 1);
//			placeFlagHasCacheAsBitmap = Tools.readUBits(bt, start+5, 1);
//			placeFlaghasBlendMode = Tools.readUBits(bt, start+6, 1);
//			placeFlagHasFilterList = Tools.readUBits(bt, start+7, 1);
			
			depth = bt.readUI16();
			
			if(placeFlagHasClassName || (placeFlagHasImage && placeFlagHasCharacter))
			{
				className = bt.readString();
			}
			if(placeFlagHasCharacter)
			{
				characterId = bt.readUI16();
			}
			if(placeFlagHasMatrix)
			{
				matrix = new Matrix(bt);
			}
			if(placeFlagHasColorTransform)
			{
				colortransform = new CXFormWithAlpha(bt);
			}
			if(placeFlagHasRatio)
			{
				name = bt.readString();
			}
			if(placeFlagHasName)
			{
				name = bt.readString();
			}
			if(placeFlagHasClipDepth)
			{
				clipDepth = bt.readUI16();
			}
			if(placeFlagHasFilterList)
			{
				var numberOfFilters:uint = bt.readUI8();
				for (var i:int = 0; i < numberOfFilters; i++) 
				{
					surfaceFilterList.push( new FilterList(bt) );
				}
			}
			if(placeFlaghasBlendMode)
			{
				blendMode = bt.readUI8();
			}
			if(placeFlagHasCacheAsBitmap)
			{
				bitmapCache = bt.readUI8();
			}
			if(placeFlagHasClipActions)
			{
				clipActions = new ClipActions(bt);
			}
		}
		
		override public function toXML():XML
		{
			var xml:XML = <PlaceObject3 />;
			xml.@type = tagType;
			xml.@placeFlagHasClipActions = placeFlagHasClipActions;
			xml.@placeFlagHasClipDepth = placeFlagHasClipDepth;
			xml.@placeFlagHasName = placeFlagHasName;
			xml.@placeFlagHasRatio = placeFlagHasRatio;
			if(placeFlagHasCharacter)
				xml.@characterId = characterId;
			if(matrix)
				xml.@matrix = matrix.toString();
			if(placeFlagHasClipDepth)
				xml.@clipDepth = clipDepth;
			xml.@depth = depth;
			
			return xml;
		}
	}
}