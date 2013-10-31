package com.alonepig.abc.data
{
	import com.alonepig.abc.ABCData;
	import com.alonepig.abc.BaseABCData;
	
	/**
	 *  
	 *  存在Method中， 有多少个paramCount就有多少个Param_info 
	 */	
	public class Param_info extends BaseABCData
	{
		public var param_name:int;
		
		public function Param_info(bt:ABCData=null)
		{
			super(bt);
		}
		
		override public function read(bt:ABCData):void
		{
			param_name = bt.readU32();
		}
	}
}