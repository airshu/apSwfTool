package com.alonepig.abc.multinames
{
	public class TypeName
	{
		private var name:*;
		private var types:Array;
		
		public function TypeName(name:*, types:Array)
		{
			this.name = name;
			this.types = types;
		}
		
		public function toString():String 
		{
			var s:String = name.toString();
			s += ".<";
			for( var i:int = 0; i < types.length; ++i )
				s += types[i] != null ? types[i].toString() : "*" + " ";
			s += ">";
			return s;
		}
	}
}