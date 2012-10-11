package QuizApp.events
{
	/**
	 * ...
	 * @author arneil mercado
	 */
	
	import flash.events.Event;
	
	public class GlobalEvent extends Event
	{
		private var _body:Object;
		
		public function GlobalEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
		
		public override function clone():Event
		{
			return new GlobalEvent(type, bubbles, cancelable);
		}
		
		public override function toString():String
		{
			return formatToString("GlobalEvent", "type", "bubbles", "cancelable", "eventPhase");
		}
		
		public function get body():Object
		{
			return _body;
		}
		
		public function set body(value:Object):void
		{
			_body = value;
		}
	
	}

}