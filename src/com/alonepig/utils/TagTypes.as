package com.alonepig.utils
{
	import com.alonepig.swf.tags.CSMTextSettings;
	import com.alonepig.swf.tags.DebugID;
	import com.alonepig.swf.tags.DefineBinaryData;
	import com.alonepig.swf.tags.DefineBits;
	import com.alonepig.swf.tags.DefineBitsJPEG2;
	import com.alonepig.swf.tags.DefineBitsJPEG3;
	import com.alonepig.swf.tags.DefineBitsJPEG4;
	import com.alonepig.swf.tags.DefineBitsLossless;
	import com.alonepig.swf.tags.DefineBitsLossless2;
	import com.alonepig.swf.tags.DefineButton;
	import com.alonepig.swf.tags.DefineButton2;
	import com.alonepig.swf.tags.DefineButtonCxform;
	import com.alonepig.swf.tags.DefineButtonSound;
	import com.alonepig.swf.tags.DefineEditText;
	import com.alonepig.swf.tags.DefineFont;
	import com.alonepig.swf.tags.DefineFont2;
	import com.alonepig.swf.tags.DefineFont3;
	import com.alonepig.swf.tags.DefineFont4;
	import com.alonepig.swf.tags.DefineFontAlignZones;
	import com.alonepig.swf.tags.DefineFontInfo;
	import com.alonepig.swf.tags.DefineFontInfo2;
	import com.alonepig.swf.tags.DefineFontName;
	import com.alonepig.swf.tags.DefineMorphShape;
	import com.alonepig.swf.tags.DefineMorphShape2;
	import com.alonepig.swf.tags.DefineScalingGrid;
	import com.alonepig.swf.tags.DefineSceneAndFrameLabelData;
	import com.alonepig.swf.tags.DefineShape;
	import com.alonepig.swf.tags.DefineShape2;
	import com.alonepig.swf.tags.DefineShape3;
	import com.alonepig.swf.tags.DefineShape4;
	import com.alonepig.swf.tags.DefineSound;
	import com.alonepig.swf.tags.DefineSprite;
	import com.alonepig.swf.tags.DefineText;
	import com.alonepig.swf.tags.DefineText2;
	import com.alonepig.swf.tags.DefineVideoStream;
	import com.alonepig.swf.tags.DoABC;
	import com.alonepig.swf.tags.DoAction;
	import com.alonepig.swf.tags.DoInitAction;
	import com.alonepig.swf.tags.EnableDebugger;
	import com.alonepig.swf.tags.EnableDebugger2;
	import com.alonepig.swf.tags.End;
	import com.alonepig.swf.tags.ExportAssets;
	import com.alonepig.swf.tags.FileAttributes;
	import com.alonepig.swf.tags.FrameLabel;
	import com.alonepig.swf.tags.ImportAssets;
	import com.alonepig.swf.tags.ImportAssets2;
	import com.alonepig.swf.tags.JPEGTables;
	import com.alonepig.swf.tags.Metadata;
	import com.alonepig.swf.tags.PlaceObject;
	import com.alonepig.swf.tags.PlaceObject2;
	import com.alonepig.swf.tags.PlaceObject3;
	import com.alonepig.swf.tags.ProductInfo;
	import com.alonepig.swf.tags.Protect;
	import com.alonepig.swf.tags.RemoveObject;
	import com.alonepig.swf.tags.RemoveObject2;
	import com.alonepig.swf.tags.ScriptLimits;
	import com.alonepig.swf.tags.SetBackgroundColor;
	import com.alonepig.swf.tags.SetTabIndex;
	import com.alonepig.swf.tags.ShowFrame;
	import com.alonepig.swf.tags.SoundStreamBlock;
	import com.alonepig.swf.tags.SoundStreamHead;
	import com.alonepig.swf.tags.SoundStreamHead2;
	import com.alonepig.swf.tags.StartSound;
	import com.alonepig.swf.tags.StartSound2;
	import com.alonepig.swf.tags.SymbolClass;
	import com.alonepig.swf.tags.VideoFrame;
	import com.alonepig.swf.tags.newtag.Scout;
	

	public class TagTypes
	{
		// Flash 1 tags
		public static const TAG_END:uint = 0;
		public static const TAG_SHOWFRAME:uint = 1;
		public static const TAG_DEFINESHAPE:uint = 2;
		public static const TAG_FREECHARACTER:uint = 3;
		public static const TAG_PLACEOBJECT:uint = 4;
		public static const TAG_REMOVEOBJECT:uint = 5;
		public static const TAG_DEFINEBITS:uint = 6;
		public static const TAG_DEFINEBUTTON:uint = 7;
		public static const TAG_JPEGTABLES:uint = 8;
		public static const TAG_SETBACKGROUNDCOLOR:uint = 9;
		public static const TAG_DEFINEFONT:uint = 10;
		public static const TAG_DEFINETEXT:uint = 11;
		public static const TAG_DOACTION:uint = 12;
		public static const TAG_DEFINEFONTINFO:uint = 13;
		public static const TAG_DEFINESOUND:uint = 14;
		public static const TAG_STARTSOUND:uint = 15;
		public static const TAG_STOPSOUND:uint = 16;
		public static const TAG_DEFINEBUTTONSOUND:uint = 17;
		public static const TAG_SOUNDSTREAMHEAD:uint = 18;
		public static const TAG_SOUNDSTREAMBLOCK:uint = 19;
		// Flash 2 tags
		public static const TAG_DEFINEBITSLOSSLESS:uint = 20;
		public static const TAG_DEFINEBITSJPEG2:uint = 21;
		public static const TAG_DEFINESHAPE2:uint = 22;
		public static const TAG_DEFINEBUTTONCXFORM:uint = 23;
		public static const TAG_PROTECT:uint = 24;
		public static const TAG_PATHSAREPOSTSCRIPT:uint = 25;
		// Flash 3 tags
		public static const TAG_PLACEOBJECT2:uint = 26;
		
		public static const TAG_REMOVEOBJECT2:uint = 28;
		public static const TAG_SYNCFRAME:uint = 29;
		
		public static const TAG_FREEALL:uint = 31;
		public static const TAG_DEFINESHAPE3:uint = 32;
		public static const TAG_DEFINETEXT2:uint = 33;
		public static const TAG_DEFINEBUTTON2:uint = 34;
		public static const TAG_DEFINEBITSJPEG3:uint = 35;
		public static const TAG_DEFINEBITSLOSSLESS2:uint = 36;
		// Flash 4 tags
		public static const TAG_DEFINEEDITTEXT:uint = 37;
		public static const TAG_DEFINEVIDEO:uint = 38;
		public static const TAG_DEFINESPRITE:uint = 39;
		public static const TAG_NAMECHARACTER:uint = 40;
		public static const TAG_PRODUCTINFO:uint = 41;
		public static const TAG_DEFINETEXTFORMAT:uint = 42;
		public static const TAG_FRAMELABEL:uint = 43;
		// Flash 5 tags
		public static const TAG_DEFINEBEHAVIOR:uint = 44;
		public static const TAG_SOUNDSTREAMHEAD2:uint = 45;
		public static const TAG_DEFINEMORPHSHAPE:uint = 46;
		public static const TAG_FRAMETAG:uint = 47;
		public static const TAG_DEFINEFONT2:uint = 48;
		public static const TAG_GENCOMMAND:uint = 49;
		public static const TAG_DEFINECOMMANDOBJ:uint = 50;
		public static const TAG_CHARACTERSET:uint = 51;
		public static const TAG_FONTREF:uint = 52;
		public static const TAG_DEFINEFUNCTION:uint = 53;
		public static const TAG_PLACEFUNCTION:uint = 54;
		public static const TAG_GENTAGOBJECT:uint = 55;
		public static const TAG_EXPORTASSETS:uint = 56;
		public static const TAG_IMPORTASSETS:uint = 57;
		public static const TAG_ENABLEDEBUGGER:uint = 58;
		// Flash 6 tags
		public static const TAG_DOINITACTION:uint = 59;
		public static const TAG_DEFINEVIDEOSTREAM:uint = 60;
		public static const TAG_VIDEOFRAME:uint = 61;
		public static const TAG_DEFINEFONTINFO2:uint = 62;
		public static const TAG_DEBUGID:uint = 63;
		public static const TAG_ENABLEDEBUGGER2:uint = 64;
		public static const TAG_SCRIPTLIMITS:uint = 65;
		// Flash 7 tags
		public static const TAG_SETTABINDEX:uint = 66;
		// Flash 8 tags
		
		
		public static const TAG_FILEATTRIBUTES:uint = 69;
		public static const TAG_PLACEOBJECT3:uint = 70;
		public static const TAG_IMPORTASSETS2:uint = 71;
		public static const TAG_DEFINEFONTALIGNZONES:uint = 73;
		public static const TAG_CSMTEXTSETTINGS:uint = 74;
		public static const TAG_DEFINEFONT3:uint = 75;
		public static const TAG_SYMBOLCLASS:uint = 76;
		public static const TAG_METADATA:uint = 77;
		public static const TAG_SCALINGGRID:uint = 78;
		
		
		
		public static const TAG_DOABC:uint = 82;
		public static const TAG_DEFINESHAPE4:uint = 83;
		public static const TAG_DEFINEMORPHSHAPE2:uint = 84;
		
		// Flash 9 tags
		public static const TAG_DEFINESCENEANDFRAMELABELDATA:uint = 86;
		public static const TAG_DEFINEBINARYDATA:uint = 87;
		public static const TAG_DEFINEFONTNAME:uint = 88;
		public static const TAG_STARTSOUND2:uint = 89;
		public static const TAG_DEFINEBITSJPEG4:uint = 90;
		// Flash 10 tags
		public static const TAG_DEFINEFONT4:uint = 91;
		
		
		// new tags
		public static const TAG_SCOUT:uint = 93;
		
		
		/**
		 * tagType => tag 名称 
		 */     
		private static const TAG_NAMES:Array = [];
		
		/**
		 * tagType => tag class
		 */      
		private static const TAG_CLASS:Array = [];
		
			
		public static function init():void
		{
			for(var i:int=0; i<100; i++)
			{
				TAG_CLASS[i] = null;
				TAG_NAMES[i] = null;
			}
			TAG_CLASS[0] = End;
			TAG_CLASS[1] = ShowFrame;
			TAG_CLASS[2] = DefineShape;
			TAG_CLASS[4] = PlaceObject;
			TAG_CLASS[5] = RemoveObject;
			TAG_CLASS[6] = DefineBits;
			TAG_CLASS[7] = DefineButton;
			TAG_CLASS[8] = JPEGTables;
			TAG_CLASS[9] = SetBackgroundColor;
			TAG_CLASS[10] = DefineFont;
			TAG_CLASS[11] = DefineText;
			TAG_CLASS[12] = DoAction;
			TAG_CLASS[13] = DefineFontInfo;
			TAG_CLASS[14] = DefineSound;
			TAG_CLASS[15] = StartSound;
			TAG_CLASS[17] = DefineButtonSound;
			TAG_CLASS[18] = SoundStreamHead;
			TAG_CLASS[19] = SoundStreamBlock;
			TAG_CLASS[20] = DefineBitsLossless;
			TAG_CLASS[21] = DefineBitsJPEG2;
			TAG_CLASS[22] = DefineShape2;
			TAG_CLASS[23] = DefineButtonCxform;
			TAG_CLASS[24] = Protect;
			TAG_CLASS[26] = PlaceObject2;
			TAG_CLASS[28] = RemoveObject2;
			TAG_CLASS[32] = DefineShape3;
			TAG_CLASS[33] = DefineText2;
			TAG_CLASS[34] = DefineButton2;
			TAG_CLASS[35] = DefineBitsJPEG3;
			TAG_CLASS[36] = DefineBitsLossless2;
			TAG_CLASS[37] = DefineEditText;
			TAG_CLASS[39] = DefineSprite;
			TAG_CLASS[41] = ProductInfo;
			TAG_CLASS[43] = FrameLabel;
			TAG_CLASS[45] = SoundStreamHead2;
			TAG_CLASS[46] = DefineMorphShape;
			TAG_CLASS[48] = DefineFont2;
			TAG_CLASS[56] = ExportAssets;
			TAG_CLASS[57] = ImportAssets;
			TAG_CLASS[58] = EnableDebugger;
			TAG_CLASS[59] = DoInitAction;
			TAG_CLASS[60] = DefineVideoStream;
			TAG_CLASS[61] = VideoFrame;
			TAG_CLASS[62] = DefineFontInfo2;
			TAG_CLASS[63] = DebugID;
			TAG_CLASS[64] = EnableDebugger2;
			TAG_CLASS[65] = ScriptLimits;
			TAG_CLASS[66] = SetTabIndex;
			TAG_CLASS[69] = FileAttributes;
			TAG_CLASS[70] = PlaceObject3;
			TAG_CLASS[71] = ImportAssets2;
			TAG_CLASS[73] = DefineFontAlignZones;
			TAG_CLASS[74] = CSMTextSettings;
			TAG_CLASS[75] = DefineFont3;
			TAG_CLASS[76] = SymbolClass;
			TAG_CLASS[77] = Metadata;
			TAG_CLASS[78] = DefineScalingGrid;
			TAG_CLASS[82] = DoABC;
			TAG_CLASS[83] = DefineShape4;
			TAG_CLASS[84] = DefineMorphShape2;
			TAG_CLASS[86] = DefineSceneAndFrameLabelData;
			TAG_CLASS[87]= DefineBinaryData;
			TAG_CLASS[88] = DefineFontName;
			TAG_CLASS[89] = StartSound2;
			TAG_CLASS[90] = DefineBitsJPEG4;
			TAG_CLASS[91] = DefineFont4;
			
			TAG_CLASS[93] = Scout;
			
			
			
			TAG_NAMES[0] = "End";
			TAG_NAMES[1] = "ShowFrame";
			TAG_NAMES[2] = "DefineShape2";
			TAG_NAMES[4] = "PlaceObject";
			TAG_NAMES[5] = "RemoveObject";
			TAG_NAMES[6] = "DefineBits";
			TAG_NAMES[7] = "DefineButton";
			TAG_NAMES[8] = "JPEGTables";
			TAG_NAMES[9] = "SetBackgroundColor";
			TAG_NAMES[10] = "DefineFont";
			TAG_NAMES[11] = "DefineText";
			TAG_NAMES[12] = "DoAction";
			TAG_NAMES[13] = "DefineFontInfo";
			TAG_NAMES[14] = "DefineSound";
			TAG_NAMES[15] = "StartSound";
			TAG_NAMES[17] = "DefineButtonSound";
			TAG_NAMES[18] = "SoundStreamHead";
			TAG_NAMES[19] = "SoundStreamBlock";
			TAG_NAMES[20] = "DefineBitsLossless";
			TAG_NAMES[21] = "DefineBitsJPEG2";
			TAG_NAMES[22] = "DefineShape";
			TAG_NAMES[23] = "DefineButtonCxform";
			TAG_NAMES[24] = "Protect";
			TAG_NAMES[26] = "PlaceObject2";
			TAG_NAMES[28] = "RemoveObject2";
			TAG_NAMES[32] = "DefineShape3";
			TAG_NAMES[33] = "DefineText2";
			TAG_NAMES[34] = "DefineButton2";
			TAG_NAMES[35] = "DefineBitsJPEG3";
			TAG_NAMES[36] = "DefineBitsLossless2";
			TAG_NAMES[37] = "DefineEditText";
			TAG_NAMES[39] = "DefineSprite";
			TAG_NAMES[41] = "ProductInfo";
			TAG_NAMES[43] = "FrameLabel";
			TAG_NAMES[45] = "SoundStreamHead2";
			TAG_NAMES[46] = "DefineMorphShape";
			TAG_NAMES[48] = "DefineFont2";
			TAG_NAMES[56] = "ExportAssets";
			TAG_NAMES[57] = "ImportAssets";
			TAG_NAMES[58] = "EnableDebugger";
			TAG_NAMES[59] = "DoInitAction";
			TAG_NAMES[60] = "DefineVideoStream";
			TAG_NAMES[61] = "VideoFrame";
			TAG_NAMES[62] = "DefineFontInfo2";
			TAG_NAMES[63] = "DebugID";
			TAG_NAMES[64] = "EnableDebugger2";
			TAG_NAMES[65] = "ScriptLimits";
			TAG_NAMES[66] = "SetTabIndex";
			TAG_NAMES[69] = "FileAttributes";
			TAG_NAMES[70] = "PlaceObject3";
			TAG_NAMES[71] = "ImportAssets2";
			TAG_NAMES[73] = "DefineFontAlignZones";
			TAG_NAMES[74] = "CSMTextSettings";
			TAG_NAMES[75] = "DefineFont3";
			TAG_NAMES[76] = "SymbolClass";
			TAG_NAMES[77] = "Metadata";
			TAG_NAMES[78] = "DefineScalingGrid";
			TAG_NAMES[82] = "DoABC";
			TAG_NAMES[83] = "DefineShape4";
			TAG_NAMES[84] = "DefineMorphShape2";
			TAG_NAMES[86] = "DefineSceneAndFrameLabelData";
			TAG_NAMES[87]= "DefineBinaryData";
			TAG_NAMES[88] = "DefineFontName";
			TAG_NAMES[89] = "StartSound2";
			TAG_NAMES[90] = "DefineBitsJPEG4";
			TAG_NAMES[91] = "DefineFont4";
			
			TAG_NAMES[93] = "Scout";
			
		}
		
		/**
		 * 根据编号获取tag名称 
		 * @param tagType
		 * @return 
		 * 
		 */     
		public static function getTagNameByTagType(tagType:int):String
		{
			return TAG_NAMES[tagType] || null;
		}
		
		/**
		 * 根据变化获取tag class 
		 * @param tagType
		 * @return 
		 * 
		 */     
		public static function getTagClassByTagType(tagType:int):Class
		{
			return TAG_CLASS[tagType] || null;
		}
	}
}
