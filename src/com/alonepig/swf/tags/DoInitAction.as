package com.alonepig.swf.tags
{
	import com.alonepig.swf.records.actions.ActionRecord;

	/**
	 * type = 59 
	 * 
	 */	
	public class DoInitAction extends Tag
	{
		/**
		 * 对应的Sprite Id 
		 */		
		public var spriteId:uint;
		public var actions:Vector.<ActionRecord>;
		public var actionEndFlag:uint;
		
		public function DoInitAction()
		{
			actions = new Vector.<ActionRecord>();
			super();
		}
		
		override public function parse():void
		{
			spriteId = bt.readUI16();
			
			var action:ActionRecord;
			while((action = bt.readActionRecord()) != null)
			{
				actions.push( action );
			}
		}
		
		override public function toXML():XML
		{
			var xml:XML = <DoInitAction />;
			xml.@type = tagType;
			xml.@length = tagLength;
			xml.@spriteId = spriteId;
			for (var i:int = 0; i < actions.length; i++) 
			{
				xml.appendChild( actions[i].toXML() );
			}
			
			return xml;
		}
		
	}
}