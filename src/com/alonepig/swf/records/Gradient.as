package com.alonepig.swf.records
{
	import com.alonepig.swf.SWFData;
	
	public class Gradient extends BaseData
	{
		public var spreadMode:uint;
		public var interpolationMode:uint;
		public var numGradients:uint;
		public var gradientRecords:Vector.<GradRecord>;
		
		public function Gradient(bt:SWFData=null)
		{
			super(bt);
		}
		
		override public function read(bt:SWFData):void
		{
			bt.resetBitsPending();
			gradientRecords = new Vector.<GradRecord>();
			var start:int = bt.position*8;
			spreadMode = bt.readUB(2);
			interpolationMode = bt.readUB(2);
			numGradients = bt.readUB(4);
			var gradRecord:GradRecord;
			for (var i:int = 0; i < numGradients; i++) 
			{
				gradRecord = new GradRecord();
				gradRecord.shapeType = shapeType;
				gradRecord.read(bt);
				gradientRecords.push( gradRecord );
			}
		}
		
		
	}
}