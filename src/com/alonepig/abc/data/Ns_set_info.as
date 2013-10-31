package com.alonepig.abc.data
{
	import com.alonepig.abc.ABCData;
	import com.alonepig.abc.BaseABCData;
	
	public class Ns_set_info extends BaseABCData
	{
		public var count:uint;
		public var ns:Vector.<uint>;
		
		public function Ns_set_info(bt:ABCData=null)
		{
			super(bt);
		}
		
		override public function read(bt:ABCData):void
		{
			count = bt.readU30();
			ns = new Vector.<uint>();
			for (var i:int = 0; i < count; i++) 
			{
				ns.push( bt.readU32() );
			}
		}
		
		
	}
}