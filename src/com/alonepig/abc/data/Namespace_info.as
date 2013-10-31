package com.alonepig.abc.data
{
	import com.alonepig.abc.ABCData;
	import com.alonepig.abc.BaseABCData;
	
	public class Namespace_info extends BaseABCData
	{
		public static const NAMESPACE:int = 0x08;
		public static const PACKAGE_NAMESPACE:int = 0x16;
		public static const PACKAGE_INTERNAL_NAMESPACE:int = 0x17;
		public static const PROTECTED_NAMESPACE:int = 0x18;
		public static const EXPLICIT_NAMESPACE:int = 0x19;
		public static const STATIC_PROTECTED_NAMESPACE:int = 0x1A;
		public static const PRIVATE_NAMESPACE:int = 0x05;
		
		/**
		 * 以上的类型 
		 */		
		public var kind:int = NAMESPACE;
		/**
		 * strings中的序列
		 */		
		public var name:int; 
		/**
		 * name 对应的真实字符串
		 * 由于需要获取name对应的值，需要使用strings，所以解析不在read中处理 
		 */		
		public var nameStr:String;
		
		public function Namespace_info(bt:ABCData=null)
		{
			super(bt);
		}
		
		override public function read(bt:ABCData):void
		{
		}
		
		/**
		 * 返回namespace的真实值  这里包含了类的全限定名 
		 * Class 中关联Instance  =====>multinames====>namespace  
		 */		
		public function toString():String
		{
			return nameStr;
		}
		
	}
}