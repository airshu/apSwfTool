package com.alonepig.swf.tags
{
	import com.alonepig.swf.records.CXForm;
	import com.alonepig.swf.records.ClipActions;
	import com.alonepig.swf.records.Matrix;

	/**
	 * type =  4
	 * 添加一个角色到显示列表
	 */	
	public class PlaceObject extends Tag
	{
		/**
		 * @since SWF5 
		 */		
		public var placeFlagHasClipActions:uint;
		public var placeFlagHasClipDepth:uint;
		public var placeFlagHasName:uint;
		/**
		 * 
		 */		
		public var placeFlagHasRatio:uint;
		public var placeFlagHasColorTransform:uint;
		/**
		 * has Matrix 
		 */		
		public var placeFlagHasMatrix:uint;
		public var placeFlagHasCharacter:uint;
		public var placeFlagMove:uint;
		/**
		 * 深度 
		 */		
		public var depth:uint;
		public var characterId:Object;
		/**
		 * 位置 
		 */		
		public var matrix:Matrix;
		/**
		 * 颜色效果 
		 */		
		public var colortransform:CXForm;
		/**
		 *为0则在形态的开始就显示  
		 */		
		public var ratio:Object;
		/**
		 * 为SetTarget定义了角色 
		 */		
		public var name:String;
		/**
		 * 最大深度 
		 */		
		public var clipDepth:Object;
		public var clipActions:ClipActions;
		
		
		public function PlaceObject()
		{
			super();
		}
		
		override public function parse():void
		{
			if(!allowChildParse)
				return;
			
			var pos:uint = bt.position;
			characterId = bt.readUnsignedShort();
			depth = bt.readUnsignedShort();
			matrix = new Matrix(bt);
			placeFlagHasCharacter = 1;
			placeFlagHasMatrix = 1;
			if(bt.position - pos < tagLength)
			{
				colortransform = new CXForm(bt);
				placeFlagHasColorTransform = 1;
			}
			
		}
	}
}