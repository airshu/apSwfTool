package com.alonepig.abc
{
	/**
	 * 所有ABC 标签基类 
	 * 
	 * 后缀以Str结尾的变量都是实际值
	 */	
	public class BaseABCData
	{
		public function BaseABCData(bt:ABCData=null)
		{
			if(bt)
				read(bt);
		}
		
		public function read(bt:ABCData):void
		{
			
		}
		
		public function toXML():XML
		{
			var xml:XML = <BaseABCData />;

			return xml;
		}
	}
}