package com.alonepig.abc.data
{
	import com.alonepig.abc.ABCData;
	import com.alonepig.abc.BaseABCData;

	/**
	 * 运行时对象 完整定义一个AS3 类
	 * 
	 */	
	public class Instance_info extends BaseABCData
	{
		public static const CONSTANT_ClassSealed:uint = 0x01;
		public static const CONSTANT_ClassFinal:uint = 0x02;
		public static const CONSTANT_ClassInterface:uint = 0x04;
		public static const CONSTANT_ClassProtectedNs:uint = 0x08;
		
		
		/**
		 * multiname 中的下标 类型为QName
		 */		
		public var name:int;
		/**
		 * multiname 中的下标， 基类名字 
		 */		
		public var super_name:int;
		public var flags:int;
		/**
		 * namespace 下标 
		 */		
		public var protectedNs:int;
		/**
		 * 接口个数 
		 */		
		public var intrf_count:int;
		public var interfaces:Vector.<int>;
		/**
		 * abc method 下标 
		 * 在MethodBody中method变量等于这个值的都属于该方法的方法体
		 */		
		public var iinit:int;
		public var trait_count:int;
		public var traits:Vector.<Traits_info>;
		
		/**
		 * QName中的name值  类名
		 */		
		public var nameStr:String;
		/**
		 * 基类名字
		 */		
		public var super_nameStr:String;
		
		public function Instance_info(bt:ABCData)
		{
			interfaces = new Vector.<int>();
			traits = new Vector.<Traits_info>();
			super(bt);
		}
		
		override public function read(bt:ABCData):void
		{
			name = bt.readU32();
			super_name = bt.readU32();
			flags = bt.readByte();
			if(flags & CONSTANT_ClassProtectedNs)
			{
				protectedNs = bt.readU32();
			}
			intrf_count = bt.readU32();
			var i:int;
			for (i = 0; i < intrf_count; i++) 
			{
				interfaces.push( bt.readU32() );
				// 关联到常量池中的multiname下标
			}
			iinit = bt.readU32();
			trait_count = bt.readU32();
			for (i = 0; i < trait_count; i++) 
			{
				traits.push( new Traits_info(bt) );
			}
			
		}
		
		
		
	}
}