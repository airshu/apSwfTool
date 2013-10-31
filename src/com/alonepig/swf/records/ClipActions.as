package com.alonepig.swf.records
{
	import com.alonepig.model.ModelLocator;
	import com.alonepig.swf.SWFData;
	
	public class ClipActions extends BaseData
	{
		public var reserved:uint;// 一定为0
		public var allEventFlags:ClipEventFlags;
		public var clipActionRecords:Vector.<ClipActionRecord>;
		/**
		 * 如果SWF版本<=5，则是UI16，否则为UI32， 结果一定是0 
		 */		
		public var clipActionEndFlag:uint;
		
		public function ClipActions(bt:SWFData=null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			reserved = bt.readUnsignedShort();
			allEventFlags = new ClipEventFlags(bt);
			clipActionRecords = new Vector.<ClipActionRecord>();
			
			if(ModelLocator.getInstance().swf.version<6)
				clipActionEndFlag = bt.readUnsignedShort();
			else
				clipActionEndFlag = bt.readUnsignedInt();
		}
		
		
	}
}