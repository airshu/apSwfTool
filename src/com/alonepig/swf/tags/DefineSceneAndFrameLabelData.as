package com.alonepig.swf.tags
{
	import com.alonepig.swf.data.EncodedU32;
	import com.alonepig.utils.DString;

	/**
	 * type = 86 
	 * 
	 */	
	public class DefineSceneAndFrameLabelData extends Tag
	{
		public var sceneCount:uint;//场景个数
		public var frameLabelCount:uint;//帧标签个数
		public var scenes:Vector.<Object>;
		public var frameLabels:Vector.<Object>;
		
		public function DefineSceneAndFrameLabelData()
		{
			super();
		}
		
		override public function parse():void
		{
			super.parse();
			
			if(!allowChildParse)
				return;
			
			sceneCount = bt.readEncodedU32();
			var i:uint;
			var obj:Object;
			scenes = new Vector.<Object>();
			for(i=0; i<sceneCount; i++)
			{
				obj = {};
				obj.offset = bt.readEncodedU32();
				obj.name = bt.readString();
				scenes.push( obj );
			}
			
			frameLabels = new Vector.<Object>();
			frameLabelCount = bt.readEncodedU32();
			for(i=0; i<frameLabelCount; i++)
			{
				obj = {};
				obj.frameNumber = bt.readEncodedU32();
				obj.frameLabel = bt.readString();
				frameLabels.push( obj );
			}
		}
		
		override public function toString():String
		{
			var str:String = super.toString();
			var ob:Object;
			var i:uint;
			str += "\n(DefineSceneAndFrameLabelData).sceneCount：" + sceneCount;
			for(i = 0; i < sceneCount; i++){
				ob = scenes[i];
				str += "\noffset" + i + "：" + ob.offset;
				str += "\nname" + i + "：" + ob.name;
			}
			str += "\nframeLabelCount：" + frameLabelCount;
			for(i = 0; i < frameLabelCount; i++){
				ob = frameLabels[i];
				str += "\nframeNumber" + i + "：" + ob.frameNumber;
				str += "\nframeLabel" + i + "：" + ob.frameLabel;
			}
			return str;
		}
		
		override public function toXML():XML
		{
			var xml:XML = <DefineSceneAndFrameLabelData />;
			xml.@type = tagType;
			xml.@sceneCount = sceneCount;
			var i:int;
			var item:XML;
			if(sceneCount>0)
			{
				for(i=0; i<sceneCount; i++)
				{
					item = <Scene />;
					item.@offset = scenes[i].offset;
					item.@name = scenes[i].name;
					xml.appendChild( item );
				}
			}
			if(frameLabelCount>0)
			{
				for(i=0; i<frameLabelCount; i++)
				{
					item = <FrameLabel />;
					item.@frameNumber = scenes[i].frameNumber;
					item.@frameLabel = scenes[i].frameLabel;
					xml.appendChild( item );
				}
			}
			xml.@frameLabelCount = frameLabelCount;
			return xml;
		}
	}
}