package com.alonepig.abc.data
{
	import com.alonepig.abc.ABCData;
	import com.alonepig.abc.BaseABCData;
	import com.alonepig.abc.multinames.Multiname;
	import com.alonepig.abc.multinames.TypeName;
	import com.alonepig.model.ModelLocator;
	
	public class Multiname_info extends BaseABCData
	{
		
		public static const MULTINAME_KIND:Object = {
			0x07:"QName",
			0x0D:"QNameA",
			0x0F:"RTQName",
			0x10:"RTQNameA",
			0x11:"RTQNameL",
			0x12:"RTQNameLA",
			0x13:"NameL",
			0x14:"NameLA",
			0x09:"Multiname",
			0x0E:"MultinameA",
			0x1B:"MultinameL",
			0x1C:"MultinameLA"};
		
		/**
		 * 不同的kind对应不同的multiname data 保存对象
		 */		
		public var kind:int;
		
		/**
		 * 不同的multiname的属性结果
		 */		
		public var ns:int;
		public var name:int;
		public var ns_set:int;
		
		public var data:Object = new QName(new Namespace(""), null); 
		
		public function Multiname_info(bt:ABCData=null)
		{
			super(bt);
		}
		
		override public function read(bt:ABCData):void
		{
			kind = bt.readUnsignedByte();
			switch(kind)
			{
				case 0x07:
				case 0x0D:
					ns = bt.readU32();
					name = bt.readU32();
					data = new QName(ModelLocator.abc.constant_info.namespaces[ns], ModelLocator.abc.constant_info.strings[name].utf8);
					trace(data.toString());
					break;
				case 0x0F:
				case 0x10:
					name = bt.readU32();
					data = new QName(ModelLocator.abc.constant_info.strings[name].utf8);
					break;
				case 0x11:
				case 0x12://The multiname_kind_RTQNameL format is used for kinds CONSTANT_RTQNameL and CONSTANT_RTQNameLA
					data = null;
					break;
				case 0x13:
				case 0x14:
					data = new QName(new Namespace(""), null);
					break;
				case 0x09:
				case 0x0E:
					name = bt.readU32();
					ns_set = bt.readU32();
					data = new Multiname(ns_set, name);
					data.ns_setValue = ModelLocator.abc.constant_info.ns_set[ns_set].ns;
					data.nameValue = ModelLocator.abc.constant_info.strings[name].utf8;
					break;
				case 0x1B:
				case 0x1C:
					ns_set = bt.readU32();
					data = new Multiname(ns_set, 0);
					data.ns_setValue = ModelLocator.abc.constant_info.ns_set[ns_set].ns;
					break;
				case 0x1D:
					/*
Vector 是0x1D
type  u30
name_count u30
name u30[name_count]
					*/
					var sName:int = bt.readU32();
					var count:int = bt.readU32();
					var types:Array = [];
					for(var i:int = 0; i < count; i++){
						types.push(bt.readU32());
					}
					data = new TypeName(ModelLocator.abc.constant_info.multinames[sName].data, types);
					
					break;
			}
		}
		
	}
}