package com.alonepig.swf.tags
{
	
	

	/**
	 * type = 43 
	 * 指定当前帧的名字
	 * ActionGoToLabel使用这个名字来确定帧
	 */	
	public class FrameLabel extends Tag
	{
		
		public var name:String;
		
		/**
		 * swf 6以后才有  值始终为1 
		 */		
		public var namedAnchorFlag:uint;
		
		public function FrameLabel()
		{
			super();
		}
		
		override public function parse():void
		{
			name = bt.readString();
			if(bt.position < tagLength)
				namedAnchorFlag = bt.readUI8();
		}
		
		override public function toXML():XML
		{
			var xml:XML = <FrameLabel />;
			xml.@type = tagType;
			xml.@name = name;
			if(namedAnchorFlag)
				xml.@namedAnchorFlag = namedAnchorFlag;
			
			return xml;
		}
	}
}