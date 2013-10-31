package com.alonepig.model
{
	import com.alonepig.abc.ABC;
	import com.alonepig.swf.SWF;

	public class ModelLocator
	{
		
		private var _swf:SWF;
		
		public static var abc:ABC;
		
		private static var instance:ModelLocator;
		public function ModelLocator()
		{
		}
		
		public function get swf():SWF
		{
			return _swf;
		}

		public function set swf(value:SWF):void
		{
			_swf = value;
		}

		public static function getInstance():ModelLocator
		{
			if(!instance)
				instance = new ModelLocator();
			return instance;
		}
		
		
		
		
	}
}