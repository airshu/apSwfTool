package com.alonepig.swf.tags
{
	import com.alonepig.swf.records.ButtonCondAction;
	import com.alonepig.swf.records.ButtonRecord;
	

	/**
	 * type = 34 
	 * 
	 */	
	public class DefineButton2 extends DefineButton
	{
		
		public var reservedFlag:uint;
		public var trackAsMenu:uint;
		public var actionOffset:uint;
		
		public var condActions:Vector.<ButtonCondAction>;
		
		public function DefineButton2()
		{
			condActions = new Vector.<ButtonCondAction>();
			super();
		}
		
		override public function parse():void
		{
			buttonId = bt.readUI16();
			trackAsMenu = (bt.readUI8() & 0x01)>0 ? 1 : 0;
			actionOffset = bt.readUI16();
			
			var buttonRecord:ButtonRecord;
			while(bt.readUI8()!=0)
			{
				bt.position--;
				buttonRecord = new ButtonRecord();
				buttonRecord.shapeType = 2;
				buttonRecord.read(bt);
				characters.push( buttonRecord );
			}
			if(actionOffset != 0)
			{
				var condActionSize:uint;
				do
				{
					condActionSize = bt.readUI16();
					condActions.push( new ButtonCondAction(bt) );
				}
				while(condActionSize!=0)
			}
			processRecords();
		}
		
		override public function toXML():XML
		{
			var xml:XML = <DefineButton2 />;
			xml.@type = tagType;
			xml.@length = tagLength;
			xml.@buttonId = buttonId;
			xml.@trackAsMenu = trackAsMenu;
			xml.@actionOffset = actionOffset;
			
			return xml;
		}
		
		
	}
}