package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author arneil mercado
	 */
	public class Module extends Sprite 
						implements Runner
	{	
		private var _runner:Sprite = new Sprite();
		private var _goingRight:Boolean;
		private var _stop:Boolean;
		private var _x:int;
		private var _y:int;
		
		
		public function Module():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			initialize();
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			
		}
		
		private function initialize():void
		{
			_goingRight = false;
			_x = 0;
			_y = 100;
			_stop = true;
			createSomething();
		}
		
		private function createSomething():void
		{
			
			_runner.graphics.beginFill(0xFF0000);
			_runner.graphics.drawRect(_x,_y,40,40);
			_runner.graphics.endFill();
			_runner.buttonMode = false;
			stage.addEventListener(Event.ENTER_FRAME, run);
			addChild(_runner);
		}
		
		private function run(e:Event):void
		{	
			var add:int;
			if (!_stop) 
			{
				if (_goingRight) {
						_runner.x += 10;
						
						if( _runner.x +40 >= stage.stageWidth)
							_goingRight = false;							
				}else {	
					_runner.x -= 10;
					if(_runner.x <= 0 	) 
							_goingRight = true;
											
				}
			}
		}
		
		public function stop():void 
		{
			_stop = true;
		}
		
		public function play():void
		{
			_stop = false;
		}
	
		
		
	}
	
}