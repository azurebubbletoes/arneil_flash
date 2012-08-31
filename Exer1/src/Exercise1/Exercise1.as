package Exercise1
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author arneil mercado
	 */
	public class Exercise1 extends Sprite
	{	
		private var _label:String;
		
		public function Exercise1() // NO PMD
		{
			initialize();
			stage.addEventListener(Event.COMPLETE, onComplete);
		}
		
		private function onComplete(e:Event):void 
		{
			
		}
		
		private function initialize():void 
		{
			
		}
		
		public function toString():String
		{
			return "[NewClass]";
		}
		
		public function get label():String 
		{
			return _label;
		}
		
		public function set label(value:String):void 
		{
			_label = value;
		}
	
	}

}