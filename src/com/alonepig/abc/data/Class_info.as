package com.alonepig.abc.data
{
	import com.alonepig.abc.ABCData;
	import com.alonepig.abc.BaseABCData;

	/**
	 * 类  
	 * 
	 */	
	public class Class_info extends BaseABCData
	{
		/**
		 * 与Method_info 关联  abc method列表的下标 
		 * 表示这个类的方法
		 */		
		public var cinit:int;
		public var trait_count:int;
		public var traits:Vector.<Traits_info>;
		
		
		/**
		 * 类名
		 */		
		public var name:String;
		
		
		
		public function Class_info(bt:ABCData=null)
		{
			traits = new Vector.<Traits_info>();
			super(bt);
		}
		
		override public function read(bt:ABCData):void
		{
			cinit = bt.readU32();
			trait_count = bt.readU32();
			
			for (var i:int = 0; i < trait_count; i++) 
			{
				traits.push( new Traits_info(bt) );
			}
			
		}
		
		
	}
}