package com.alonepig.swf.tags
{
	import com.alonepig.swf.records.actions.ActionRecord;

	/**
	 * type = 12 
	 * 如果FileAttribute中actionScript3为1 则该标签的内容被忽略
	 */	
	public class DoAction extends Tag
	{
		/**
		 * 执行的动作列表 
		 */		
		public var actions:Vector.<ActionRecord>;
		/**
		 * 总是为0 
		 */		
		public var actionEndFlag:uint;
		
		public function DoAction()
		{
			actions = new Vector.<ActionRecord>();
			super();
		}
		
		override public function parse():void
		{
			var actionRecord:ActionRecord;
			while((actionRecord = bt.readActionRecord()) != null)
			{
				actions.push( actionRecord );
			}
		}
		
		override public function toXML():XML
		{
			var xml:XML = <DoAction />;
			xml.@type = tagType;
			xml.@length = tagLength;
			var actionXML:XML = <action />;
			for (var i:int = 0; i < actions.length; i++) 
			{
				xml.appendChild( actions[i].toXML() );
			}
			
			return xml;
		}
	}
}