package com.alonepig.abc.data
{
	import com.alonepig.abc.ABCData;
	import com.alonepig.abc.BaseABCData;
	import com.alonepig.abc.traits.Trait_class;
	import com.alonepig.abc.traits.Trait_function;
	import com.alonepig.abc.traits.Trait_method;
	import com.alonepig.abc.traits.Trait_slot;

	/**
	 *  中枢
	 *  关联属性、方法、常量等
	 */	
	public class Traits_info extends BaseABCData
	{
		public static const Trait_Slot:int = 0;
		public static const Trait_Method:int = 1;
		public static const Trait_Getter:int = 2;
		public static const Trait_Setter:int = 3;
		public static const Trait_Class:int = 4;
		public static const Trait_Function:int = 5;
		public static const Trait_Const:int = 6;
		
		public static const ATTR_Final:int = 0x1;
		public static const ATTR_Override:int = 0x2;
		public static const ATTR_Metadata:int = 0x4;
		
		/**
		 * multiname 下标 
		 */		
		public var name:int;
		/**
		 * 拆成两个四位的数， 低四位表示类型 高四位表示是否有属性
		 */		
		public var kind:int;
		/**
		 *  根据kind的不同  对应不同的trait  
		 */		
		public var data:*;
		
		public var metadata_count:int;
		public var metadatas:Vector.<int>;
		
		public function Traits_info(bt:ABCData=null)
		{
			super(bt);
		}
		
		override public function read(bt:ABCData):void
		{
			name = bt.readU32();
			kind = bt.readByte();
			switch(kind & 0xF)
			{
				case Trait_Slot:
				case Trait_Const:
					data = new Trait_slot(bt);
					break;
				case Trait_Method:
				case Trait_Getter:
				case Trait_Setter:
					data = new Trait_method(bt);
					break;
				case Trait_Class:
					data = new Trait_class(bt);
					break;
				case Trait_Function:
					data = new Trait_function(bt);
					break;
			}
			metadata_count = 0;
			metadatas = new Vector.<int>();
			if((kind>>4) & ATTR_Metadata)
			{
				metadata_count = bt.readU32();
				var i:int=0;
				for (i = 0; i < metadata_count; i++) 
				{
					metadatas.push( bt.readU32() );
				}
			}
		}
		
		
	}
}