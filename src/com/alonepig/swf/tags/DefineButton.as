package com.alonepig.swf.tags
{
	import com.alonepig.swf.records.ButtonRecord;
	import com.alonepig.swf.records.actions.ActionRecord;
	import com.alonepig.swf.records.actions.ActionRecordFactory;

	/**
	 * type = 7 
	 * 
	 */	
	public class DefineButton extends Tag
	{
		public var buttonId:uint;
		public var characters:Vector.<ButtonRecord>;
		public var characterEndFlag:uint;// 一定为0
		public var actions:Vector.<ActionRecord>;
		public var actionEndFlag:uint;// 一定为0 
		
		public function DefineButton()
		{
			characters = new Vector.<ButtonRecord>();
			actions = new Vector.<ActionRecord>();
			super();
		}
		
		override public function parse():void
		{
			buttonId = bt.readUnsignedShort();
			var buttonRecord:ButtonRecord;
			while(bt.readUI8()!=0)
			{
				bt.position--;
				buttonRecord = new ButtonRecord(bt);
				characters.push( buttonRecord );
			}
			var actionCode:uint;
			var actionRecord:ActionRecord;
			while(bt.readUI8()!=0)
			{
				bt.position--;
				actionCode = bt.readUI8();
				if(actionCode != 0)
				{
					var length:uint = actionCode >= 0x80 ? bt.readUI16() : 0;
					actionRecord = ActionRecordFactory.create(actionCode, length);
					actions.push( actionRecord );
				}
			}
			processRecords();
		}
		
		protected function processRecords():void
		{
			
		}
		
		override public function toXML():XML
		{
			var xml:XML = <DefineButton />;
			xml.@type = tagType;
			xml.@length = tagLength;
			xml.@buttonId = buttonId;
			
			return xml;
		}
		
	}
}