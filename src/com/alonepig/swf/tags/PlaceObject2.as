package com.alonepig.swf.tags
{
	import com.alonepig.swf.records.CXFormWithAlpha;
	import com.alonepig.swf.records.ClipActions;
	import com.alonepig.swf.records.Matrix;

	/**
	 * type = 26 
	 * 控制标签
	 */	
	public class PlaceObject2 extends PlaceObject
	{
		
		
		public function PlaceObject2()
		{
			super();
		}
		
		override public function parse():void
		{
			if(!allowChildParse)
				return;
			
			var flags:uint = bt.readUI8();
			placeFlagHasClipActions = (flags & 0x80)>0 ? 1 : 0;
			placeFlagHasClipDepth = (flags & 0x40)>0 ? 1 : 0;
			placeFlagHasName = (flags & 0x20)>0 ? 1 : 0;
			placeFlagHasRatio = (flags & 0x10)>0 ? 1 : 0;
			placeFlagHasColorTransform = (flags & 0x08)>0 ? 1 : 0;
			placeFlagHasMatrix = (flags & 0x04)>0 ? 1 : 0;
			placeFlagHasCharacter = (flags & 0x02)>0 ? 1 : 0;
			placeFlagMove = (flags & 0x01)>0 ? 1 : 0;
			
			
//			var start:int = bt.position*8;
//			placeFlagHasClipActions = Tools.readUBits(bt, start, 1);
//			placeFlagHasClipDepth = Tools.readUBits(bt, start+1, 1);
//			placeFlagHasName = Tools.readUBits(bt, start+2, 1);
//			placeFlagHasRatio = Tools.readUBits(bt, start+3, 1);
//			placeFlagHasColorTransform = Tools.readUBits(bt, start+4, 1);
//			placeFlagHasMatrix = Tools.readUBits(bt, start+5, 1);
//			placeFlagHasCharacter = Tools.readUBits(bt, start+6, 1);
//			placeFlagMove = Tools.readUBits(bt, start+7, 1);

			// 角色深度
			depth = bt.readUI16();
			
			if(placeFlagHasCharacter)
			{
				characterId = bt.readUI16();
			}
			if(placeFlagHasMatrix)
			{
				// 角色的位置
				matrix = new Matrix(bt);
			}
			if(placeFlagHasColorTransform)
			{
				// 角色的颜色效果
				colortransform = new CXFormWithAlpha(bt);
			}
			if(placeFlagHasRatio)
			{
				name = bt.readString();
			}
			if(placeFlagHasClipDepth)
			{
				// 指定由剪辑层遮住的最大深度
				clipDepth = bt.readUI16();
			}
			if(placeFlagHasClipActions)
			{
				clipActions = new ClipActions(bt);
			}
			
		}
		
		override public function toXML():XML
		{
			var xml:XML = <PlaceObject2 />;
			xml.@type = tagType;
			xml.@placeFlagHasClipActions = placeFlagHasClipActions;
			xml.@placeFlagHasClipDepth = placeFlagHasClipDepth;
			xml.@placeFlagHasName = placeFlagHasName;
			xml.@placeFlagHasRatio = placeFlagHasRatio;
			if(placeFlagHasCharacter)
				xml.@characterId = characterId;
			if(placeFlagHasMatrix)
				xml.@matrix = matrix.toString();
			if(placeFlagHasClipDepth)
				xml.@clipDepth = clipDepth;
			xml.@depth = depth;
			
			return xml;
		}
		
		
	}
}