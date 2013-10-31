package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	
	public class KerningRecord extends BaseData
	{
		public var fontKerningCode1:uint;
		public var fontKerningCode2:uint;
		public var fontKerningAdjustment:int;
		
		public var fontFlagsWideCodes:uint;
		
		public function KerningRecord(bt:SWFData=null)
		{
		}
		
		override public function read(bt:SWFData):void
		{
			fontKerningCode1 = fontFlagsWideCodes ? bt.readUnsignedShort() : bt.readUnsignedByte();
			fontKerningCode2 = fontFlagsWideCodes ? bt.readUnsignedShort() : bt.readUnsignedByte();
			fontKerningAdjustment = bt.readSI16();
			
		}
	}
}