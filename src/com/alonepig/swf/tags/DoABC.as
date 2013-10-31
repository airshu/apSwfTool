package com.alonepig.swf.tags
{
	import com.alonepig.abc.ABC;
	import com.alonepig.abc.ABCData;
	import com.alonepig.utils.DString;

	/**
	 * type = 82 
	 * 
	 */	
	public class DoABC extends Tag
	{
		public var lazyInitializeFlag:Boolean;
		public var abcName:String;
		
		public var abcData:ABCData;
		
		public var abc:ABC;
		
		public function DoABC()
		{
		}
		
		override public function parse():void
		{
			super.parse();
			
			if(!allowChildParse)
			{
				return;
			}
			
			abcData = new ABCData();
			var pos:uint = bt.position;
			var flags:uint = bt.readUnsignedInt();
			lazyInitializeFlag = (flags & 0x01) != 0;
			abcName = DString.read(bt);
//			trace(abcName);
			bt.readBytes(abcData, 0, tagLength-(bt.position-pos));
			abc = new ABC(abcData);
		}
		
		override public function toXML():XML
		{
			var xml:XML = <DoABC />;
			xml.@type = tagType;
			xml.@abcName = abcName;
			xml.@lazyInitializeFlag = lazyInitializeFlag;
			xml.@dataLength = abcData.length;
			return xml;
		}
		
	}
}