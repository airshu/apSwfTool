package com.alonepig.swf
{
	import com.alonepig.abc.ABC;
	import com.alonepig.model.ModelLocator;
	import com.alonepig.swf.records.Rect;
	import com.alonepig.swf.tags.DefineBits;
	import com.alonepig.swf.tags.DefineSound;
	import com.alonepig.swf.tags.DoABC;
	import com.alonepig.swf.tags.SoundStreamHead;
	import com.alonepig.swf.tags.Tag;
	import com.alonepig.utils.TagTypes;
	
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;
	import flash.utils.CompressionAlgorithm;
	import flash.utils.Endian;
	
	import mx.controls.Alert;
	
	import apparat.lzma.LZMADecoder;
	
	
	public class SWF
	{
		public var signature:String;
		public var version:int;
		public var fileLength:int;
		public var frameRate:int;
		public var frameCount:int;
		
		public var rect:Rect;
		
		public var tags:Array;
		
		public var bt:SWFData;
		
		public static const FWS:String = "FWS";
		public static const CWS:String = "CWS";
		public static const ZWS:String = "ZWS";
		
		public var abc:Vector.<ABC>;
		
		public function SWF(_bt:SWFData=null)
		{
			ModelLocator.getInstance().swf = this;
			
			bt = _bt;
			
			parse();
		}
		
		private var decoder:LZMADecoder;
		private var properties:Vector.<int>;
		private var input:ByteArray;
		private var output:ByteArray;
		
		private  var lzmaSize:int;
		public function parse():void
		{
			if(!bt)
				return;
			
			TagTypes.init();
			bt.endian = Endian.LITTLE_ENDIAN;
			signature = bt.readUTFBytes( 3 );
			version = bt.readByte();
			fileLength = bt.readUI32();
			var tempBytes:ByteArray;
			switch(signature)
			{
				case CWS:
					tempBytes = new ByteArray();
					tempBytes.writeBytes(bt, bt.position);
					tempBytes.uncompress();
					
					var temp:int = bt.position;
					bt.length = bt.position;
					bt.writeBytes(tempBytes);
					tempBytes.length = 0;
					bt.position = temp;
					break;
				case ZWS:
/**
 * 
# Format of SWF when LZMA is used:
#
# | 4 bytes       | 4 bytes   | 4 bytes       | 5 bytes    | n bytes   | 6 bytes         |
# | 'ZWS'+version | scriptLen | compressedLen | LZMA props | LZMA data | LZMA end marker |
#
# scriptLen is the uncompressed length of the SWF data. Includes 4 bytes SWF header and
# 4 bytes for scriptLen it
#
# compressedLen does not include header (4+4+4 bytes) or lzma props (5 bytes)
# compressedLen does include LZMA end marker (6 bytes)
 */
					var outSize:int;
					// 压缩文件大小 不包括
					lzmaSize = bt.readUI32();
					
	trace(lzmaSize, fileLength-12-5, bt.length-12-5);				
	
					if(lzmaSize != bt.length-12-5)
					{
						Alert.show("不满足LZMA条件！");
						return;
					}
					tempBytes = new ByteArray();
					tempBytes.endian = Endian.LITTLE_ENDIAN;
//					tempBytes.writeBytes(bt, bt.position);
//					tempBytes.position = 0;

					var ptr:int;
					for (ptr=0;ptr<5;ptr++) 
					{  
						tempBytes[ptr]=bt[12+ptr];
					}
					// scriptLen = fileLength-8
					var scriptlen:uint=bt[4]+(bt[5]<<8)+(bt[6]<<16)+(bt[7]<<24)-8;
					for (ptr=0;ptr<4;ptr++) 
					{     
						tempBytes[5+ptr]=bt[8+ptr]; 
					}
					tempBytes[5]=scriptlen&0xFF; 
					tempBytes[6]=(scriptlen>>8) & 0xFF; 
					tempBytes[7]=(scriptlen>>16) & 0xFF; 
					tempBytes[8]=(scriptlen>>24) & 0xFF;
					for (ptr=0;ptr<4;ptr++)
					{     
						tempBytes[9+ptr]=0;
					}
					tempBytes.position = 13;
					tempBytes.writeBytes(bt, 17);
//					bt.position = 17;
//					bt.readBytes(tempBytes, 13, bt.length-bt.position);
					tempBytes.position = 0;
					
					tempBytes.uncompress(CompressionAlgorithm.LZMA);
					
					
//					properties = new Vector.<int>(5, true);
//					var i:int;
//					while(i<5)
//					{
//						properties[i] = tempBytes.readUnsignedByte();
//						i++;
//					}
//					decoder = new LZMADecoder();
//					if(!decoder.setDecoderProperties(properties))
//					{
//						trace("incorrect stream properties");
//					}
////					for(var j: int = 0; j < 8; ++j) {
////						outSize |= tempBytes.readUnsignedByte() << (8 * j)
////					}
//					output = new ByteArray();
//					if(!decoder.code(tempBytes, output, fileLength-12-5))
//					{
//						trace("Error in data stream");
//					}
					
//					new LZMADecoder().code(tempBytes, outputByte, 0);
//					tempBytes.uncompress(CompressionAlgorithm.LZMA);
					
//					outputByte.writeBytes( tempBytes );
//					tempBytes.position = 0;
//					bt.clear();
					bt.length = 0;
					bt.writeUTFBytes( "FWS" );
					bt.writeByte( version );
					bt.writeUnsignedInt(fileLength+8);
					bt.writeBytes( tempBytes );
					bt.position = 8;
					
					
					break;
				case FWS:
					break;
				default:
					trace("解析错误");
			}
			rect = new Rect(bt);
			frameRate = bt.readFIXED8();
			frameCount = bt.readUI16();
			readTags(bt);
		}
		
		private function readTags(bytes:ByteArray):void
		{
			tags = [];
			abc = new Vector.<ABC>();
			trace( "<SWF>");
			trace(toXML().toXMLString());
			var tagType:uint;
			var tagLength:uint;
			var tag:Tag;
			var TagClass:Class;
			var count:int = 0;
			while(bytes.bytesAvailable > 0)
			{
				tagType = readTagType(bytes);
				tagLength = readTagLength(bytes);
//trace("========================", tagType, "==============================");
				TagClass = TagTypes.getTagClassByTagType(tagType);
				if (TagClass == null){
					//未知Tag
					TagClass = Tag;
				}
				tag = new TagClass();
				tag.tagType = tagType;
				tag.tagLength = tagLength;
				if(tag.tagLength < 0 || bytes.position + tag.tagLength > bytes.length){
					trace("error tag length:" + tag.tagLength);
					continue;
				}
				if( tagLength > 0){
					if(TagClass != Tag)
					{
						bytes.readBytes(tag.bt, 0, tagLength);
						
						//TODO
//						if(tagLength != 120)
						tag.parse();
					}
					else
					{
						bytes.position += tagLength;
					}
				}
				if(tagType == TagTypes.TAG_DOABC)
				{
					abc.push( DoABC(tag).abc );
				}
//				if (tagType == TagTypes.TAG_DOACTION
//					|| (tagType == TagTypes.TAG_DEFINEBITSJPEG2
//						|| tagType == TagTypes.TAG_DEFINEBITS
//						|| tagType == TagTypes.TAG_DEFINEBITSLOSSLESS) && tagLength == 0){
//					continue;
//				}
				tags.push(tag);
				trace(tag.toXML().toXMLString());
				count++;
				if (tagType == TagTypes.TAG_END){
					break;
				}
			}
			trace("</SWF>");
		}
		
		/**
		 * 读取Tag的类型 
		 * @param bytes
		 * @return 
		 * 
		 */		
		private function readTagType(bytes:ByteArray):uint
		{
			var result:uint = bytes.readUnsignedShort();
			result = result >> 6;
			bytes.position -= 2;
			return result;
		}
		
		private function readTagLength(bytes:ByteArray):uint
		{
			var taglength:uint = bytes.readUnsignedShort() & 0x3F;
			if(taglength == 0x3F)
			{
				// 如果都为1，则为长类型，后面的四个字节为该类型的长度
				//否则为短类型，该字节的后6位为长度
				taglength = bytes.readUnsignedInt();
			}
			if(taglength < 0)
			{
				throw Error("无效的tag长度");
			}
			return taglength;
		}
		
		public function toXML():XML
		{
			var xml:XML = <Header />;
			xml.@type = signature;
			xml.@version = version;
			xml.@fileLength = fileLength;
			xml.@rect = rect.toString();
			xml.@frameRate = frameRate;
			xml.@frameCount = frameCount;
			return xml;
		}
		
		
		
		/**
		 * 保存新的swf 
		 * @param bt
		 * 
		 */		
		public function publish(_bt:ByteArray):void
		{
			_bt.writeUTFBytes( signature );
			_bt.writeByte( version );
			
			var data:SWFData = new SWFData();
			var fileLengthPos:uint = data.position;
//			data.writeUI32( 0 );
			data.writeRECT( rect );
			data.writeFIXED8( frameRate );
			data.writeUI16( frameCount );
			for(var i:uint=0; i<tags.length; i++)
			{
				try
				{
					tags[i].encode();						
					data.writeBytes( tags[i].bt );
					
					if(tags[i].bt.length>0)
					{
					}
//					else
//						tags[i].publish(data);
//					tags[i].publish(data);
				}
				catch(e:Error)
				{
					trace("error", tags[i].toString());
				}
			}
			var length:int = data.length + bt.length + 4;
			_bt.writeUnsignedInt( length );
			if(signature == CWS)
			{
				data.compress();
			}
			data.position = 0;
			_bt.writeBytes( data );
		}
		
		
		
		
		
		
		
		
		
		
		/**
		 * 导出音乐 
		 * @param outdir  输出路径
		 * @param _tags 
		 * 
		 */		
		public function exportSounds(outdir:String, _tags:Array):void
		{
			var sid:String;
			var tag:Tag;
			for (var i:int = 0; i < _tags.length; i++) 
			{
				tag = Tag(_tags[i]);
				if(tag is DefineSound)
				{
					sid = ""+DefineSound(tag).soundId;
					
					var st:DefineSound = DefineSound(tag);
					if(st.soundFormat == DefineSound.FORMAT_ADPCM)
					{
						
					}
					else if(st.soundFormat == DefineSound.FORMAT_MP3)
					{
						var file:File = new File(outdir);
						var fileStream:FileStream = new FileStream();
						fileStream.open(file, FileMode.WRITE);
						// MP3SoundData 前两位是seekSample SI16
						fileStream.writeBytes(st.soundData, 2, st.soundData.length-2);
					}
					else
					{
						
					}
				}
				
				if(tag is SoundStreamHead)
				{
					
				}
				
				
			}
			
		}
		
		
		/**
		 * 导出图片 
		 * @param outdir
		 * @param _tags
		 * 
		 */		
		public function exportImages(outdir:String, _tags:Array):void
		{
			if(!_tags || _tags.length == 0)
				return;
			
			var tag:Tag;
			for (var i:int = 0; i < _tags.length; i++) 
			{
				tag = Tag(_tags[i]);
				
				if(tag is DefineBits)
				{
					var db:DefineBits = DefineBits(tag);	
					var file:File = new File(outdir + "Image " + db.characterId + "." + db.getImageFormat());
					var fileStream:FileStream = new FileStream();
					fileStream.open(file, FileMode.WRITE);
					fileStream.writeBytes(db.bitmapData, 0, db.bitmapData.length);
				}
			}
			
		}
		
		
	}
}