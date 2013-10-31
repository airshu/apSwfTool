package events
{
	import flash.events.Event;
	
	public class SwfEvent extends Event
	{
		/**
		 * 更新swf信息 
		 */		
		public static const UPDATE_SWF_EVENT:String = "update_swf_event";
		
		public var data:Object;
		
		public function SwfEvent(type:String, _data:Object=null)
		{
			super(type, bubbles, cancelable);
			
			data = _data;
		}
	}
}