package com.alonepig.abc.data
{
	import com.alonepig.abc.ABCData;
	import com.alonepig.abc.BaseABCData;
	
	public class Option_detail extends BaseABCData
	{
		
		public static const KINDS:Object = {
			 0x03:"Int"
			,0x04:"UInt"
			,0x06:"Double"
			,0x01:"Utf8"
			,0x0B:"True"
			,0x0A:"False"
			,0x0C:"Null"
			,0x00:"Undefined"
			,0x08:"Namespace"
			,0x16:"PackageNamespace"
			,0x17:"PackageInternalNs"
			,0x18:"ProtectedNamespace"
			,0x19:"ExplicitNamespace"
			,0x1A:"StaticProtectedNs"
			,0x05:"PrivateNs"};
		
		/**
		 * entries 对应下标 
		 */		
		public var val:uint;
		public var kind:uint;
		
		public function Option_detail(bt:ABCData=null)
		{
			super(bt);
		}
		
		override public function read(bt:ABCData):void
		{
			val = bt.readU30();
			kind = bt.readUnsignedByte();
		}
		
	}
}