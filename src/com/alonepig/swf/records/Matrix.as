package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	import com.alonepig.utils.Tools;
	
	public class Matrix extends BaseData
	{
		public var hasScale:int;
		public var scaleX:Number=1.0;
		public var scaleY:Number=1.0;
		public var hasRotate:int;
		public var nRotateBits:int;
		public var rotateSkew0:Number=0.0;
		public var rotateSkew1:Number=0.0;
		public var translateX:int;
		public var translateY:int;
		
		public var nscaleBits:int;
		public var ntranslateBits:int;
		
		public function Matrix(bt:SWFData=null)
		{
			super(bt);
		}
	
		override public function read(bt:SWFData):void
		{
			bt.resetBitsPending();
			scaleX = scaleY = 1;
			hasScale = bt.readUB(1);
			if(hasScale)
			{
				nscaleBits = bt.readUB(5);
				scaleX = bt.readFB(nscaleBits);
				scaleY = bt.readFB(nscaleBits);
			}
			rotateSkew0 = 0.0;
			rotateSkew1 = 0.0;
			hasRotate = bt.readUB(1);
			if(hasRotate)
			{
				nRotateBits = bt.readUB(5);
				rotateSkew0 = bt.readFB(nRotateBits);
				rotateSkew1 = bt.readFB(nRotateBits);
			}
			ntranslateBits = bt.readUB(5);
			translateX = bt.readSB(ntranslateBits);
			translateY = bt.readSB(ntranslateBits);
				
			// 下面这种方式不对？
//			var start:int = bt.position*8;
//			scaleX = scaleY = 1;
//			hasScale = Tools.readUBits(bt, start, 1);
//			start += 1;
//			if(hasScale)
//			{
//				nscaleBits = Tools.readUBits(bt, start, 5);
//				scaleX = Tools.readFBits(bt, start+5, nscaleBits);
//				scaleY = Tools.readFBits(bt, start+5+nscaleBits, nscaleBits);
//				start += 5 + nscaleBits*2;
//			}
//			rotateSkew0 = 0.0;
//			rotateSkew1 = 0.0;
//			hasRotate = Tools.readUBits(bt, start, 1);
//			start += 1;
//			if(hasRotate)
//			{
//				nRotateBits = Tools.readUBits(bt, start, 5);
//				rotateSkew0 = Tools.readFBits(bt, start+5, nRotateBits);
//				rotateSkew1 = Tools.readFBits(bt, start+5+nRotateBits, nRotateBits);
//				start += 5 + nRotateBits*2;
//			}
//			ntranslateBits = Tools.readUBits(bt, start, 5);
//			translateX = Tools.readSBits(bt, start+5, ntranslateBits);
//			translateY = Tools.readSBits(bt, start+5+ntranslateBits, ntranslateBits);
			
		}
		
		override public function toString():String
		{
			var m:Array = [scaleX, rotateSkew0, rotateSkew1, scaleY, translateX, translateY];
			return "[" + m + "]";
//			return "HasScale:" + hasScale + ",HasRotate:" + hasRotate + ",NTranslateBits:" + ntranslateBits;
		}
		
	}
}