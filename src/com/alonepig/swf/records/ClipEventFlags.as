package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.utils.Tools;
	
	/**
	 * 指定一个事件处理器运用于一个或多个Sprite事件  
	 * 
	 */	
	public class ClipEventFlags extends BaseData
	{
		public var keyUp:uint;
		public var keyDown:uint;
		public var mouseUp:uint;
		public var mouseDown:uint;
		public var mouseMove:uint;
		public var unload:uint;
		public var enterFrame:uint;
		public var load:uint;
		public var dragOver:uint;
		public var rollOut:uint;
		public var rollOver:uint;
		public var releaseOutside:uint;
		public var release:uint;
		public var press:uint;
		public var initialize:uint;
		public var data:uint;
		public var construct:uint;
		public var keyPress:uint;
		public var dragOut:uint;
		
		public function ClipEventFlags(bt:SWFData=null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			var start:int = bt.position*8;
			keyUp = Tools.readUBits(bt, start, 1);
			keyDown = Tools.readUBits(bt, start+1, 1);
			mouseUp = Tools.readUBits(bt, start+2, 1);
			mouseDown = Tools.readUBits(bt, start+3, 1);
			mouseMove = Tools.readUBits(bt, start+4, 1);
			unload = Tools.readUBits(bt, start+5, 1);
			enterFrame = Tools.readUBits(bt, start+6, 1);
			load = Tools.readUBits(bt, start+7, 1);
			dragOver = Tools.readUBits(bt, start+8, 1);
			rollOut = Tools.readUBits(bt, start+9, 1);
			rollOver = Tools.readUBits(bt, start+10, 1);
			releaseOutside = Tools.readUBits(bt, start+11, 1);
			release = Tools.readUBits(bt, start+12, 1);
			press = Tools.readUBits(bt, start+13, 1);
			initialize = Tools.readUBits(bt, start+14, 1);
			data = Tools.readUBits(bt, start+15, 1);
			construct = Tools.readUBits(bt, start+16, 1);
			keyPress = Tools.readUBits(bt, start+17, 1);
			dragOut = Tools.readUBits(bt, start+18, 1);
			
			
		}
	}
}