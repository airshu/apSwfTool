package com.alonepig.abc.data
{
	import com.alonepig.abc.ABCData;
	import com.alonepig.abc.BaseABCData;

	/**
	 * 常量池
	 * 下标从1开始  所以在初始化的时候需要先初始化0
	 * 如果不设置 在其他地方获取值时下标会不对
	 * 个常量池的大小 count+1
	 */	
	public class Cpool_info extends BaseABCData
	{
		public var int_count:uint;
		public var integers:Vector.<int>;
		public var uint_count:uint;
		public var uintegers:Vector.<uint>;
		public var double_count:uint;
		public var doubles:Vector.<Number>;
		public var string_count:uint;
		public var strings:Vector.<String_info>;
		public var namespace_count:uint;
		public var namespaces:Vector.<Namespace_info>;
		public var ns_set_count:uint;
		public var ns_set:Vector.<Ns_set_info>;
		public var multiname_count:uint;
		public var multinames:Vector.<Multiname_info>;
		
		public function Cpool_info(bt:ABCData=null)
		{
			integers = new Vector.<int>();
			uintegers = new Vector.<uint>();
			doubles = new Vector.<Number>();
			strings = new Vector.<String_info>();
			namespaces = new Vector.<Namespace_info>();
			ns_set = new Vector.<Ns_set_info>();
			multinames = new Vector.<Multiname_info>();
			
			super(bt);
		}
		
		override public function read(bt:ABCData):void
		{
			readInts(bt);
			readUints(bt);
			readDoubles(bt);
			readStrings(bt);
			readNamespaces(bt);
			readNamespaceSets(bt);
			readMultinames(bt);
		}
		
		private function readMultinames(bt:ABCData):void
		{
			multiname_count = bt.readU30();
			var multinameInfo:Multiname_info;
			multinames[0] = new Multiname_info();
			for (var i:int = 1; i < multiname_count; i++) 
			{
				multinameInfo = new Multiname_info(bt);
				multinames[i] = multinameInfo;
			}
		}
		
		private function readNamespaceSets(bt:ABCData):void
		{
			ns_set_count = bt.readU30();
			ns_set[0] = null;
			for (var i:int = 1; i < ns_set_count; i++) 
			{
				ns_set[i] = new Ns_set_info(bt);
			}
		}
		
		private function readNamespaces(bt:ABCData):void
		{
			namespace_count = bt.readU30();
			
			var namespace_info:Namespace_info;
			namespaces[0] = new Namespace_info();
			for (var i:int = 1; i < namespace_count; i++) 
			{
				namespace_info = new Namespace_info();
				namespace_info.kind = bt.readByte();
				namespace_info.name = bt.readU32();
				namespace_info.nameStr = strings[namespace_info.name].utf8;
				namespaces[i] = namespace_info;
			}
		}
		
		private function readStrings(bt:ABCData):void
		{
			string_count = bt.readU32();
			var string_info:String_info = new String_info();
			string_info.utf8 = "";
			strings[0] = string_info;
			for(var i:int=1; i<string_count; i++)
			{
				string_info = new String_info(bt);			
				// 0为空，表示* 
				strings[i] = string_info;
			}
		}
		
		private function readDoubles(bt:ABCData):void
		{
			double_count = bt.readU32();
			doubles[0] = NaN;
			for(var i:int=1; i<double_count; i++)
				doubles[i] = bt.readDouble();
		}
		
		private function readUints(bt:ABCData):void
		{
			uint_count = bt.readU32();
			uintegers[0] = 0;
			for(var i:int=1; i<uint_count; i++)
				uintegers[i] = bt.readU32();
		}
		
		private function readInts(bt:ABCData):void
		{
			int_count = bt.readU32();
			integers[0] = 0;
			for(var i:int=1; i<int_count; i++)
				integers[i] = bt.readU32();
			
		}		
		
		
		
	}
}