package com.alonepig.abc.multinames
{
	public class Multiname
	{
		private var ns_set:int;
		private var name:int;
		
		
		public var nameValue:String;
		public var ns_setValue:int;
		
		public function Multiname(_nss_et:int, name:int)
		{
			this.ns_set = _nss_et;
			this.name = name;
		}
		
		public function toString():String
		{
			return /*'{' + nsset + '}::' + */nameValue
		}
	}
}