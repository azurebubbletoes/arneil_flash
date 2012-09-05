package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author arneil mercado
	 */
	public class Module extends Sprite implements IRunner
	{
		
		private var _runner:Sprite;
		private var _goingRight:Boolean;
		private var _stop:Boolean;
		private var _x:int;
		private var _y:int;
		private var _status:String;
		
		public function Module():void
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			initialize();
		}
		
		private function initialize():void
		{
			_goingRight = false;
			_status = "Stopped";
			_stop = true;
			draw();
			_runner=createRunner();
			addChild(_runner);
			stage.addEventListener(Event.ENTER_FRAME, run, false, 0, true);
		}
		
		public function draw():void
		{
			_x = 0;
			_y = 100;
			// TODO: Move to initialize _runner = createRunner();
		}
		// TODO: Rename to createRunner
		protected function createRunner():Sprite
		{	
			
			var runner:Sprite = new Sprite();
			runner.graphics.beginFill(0xFF0000);
			runner.graphics.drawRect(0, 0, 40, 40);
			runner.x = _x;
			runner.y = _y;
			runner.graphics.endFill();
			runner.buttonMode = false;
			return runner;
		}
		

		private function run(e:Event):void
		{
			var add:int;
			if (!_stop)
			{	
				_status = "Going Left";
				
				if (_goingRight)
				{
					_status = "Going Right";
					_runner.x += 10;
					
					if (_runner.x + 40 >= stage.stageWidth) {
						_status = "Bounce!";
						_goingRight = false;
					}
				}
				else
				{	
					
					_runner.x -= 10;
					if (_runner.x <= 0){
						_goingRight = true;
						_status = "Bounce!";
					}
					
				}
			}
		}
		
		public function status():String
		{
			return _status;
		}
		
		public function stop():void
		{	
			_status = "Stopped";
			_stop = true;
		}
		
		public function play():void
		{
			_stop = false;
		}
		
		public function destroy():void
		{	
			_status = "Unloaded";
			stage.removeEventListener(Event.ENTER_FRAME, run);
		}
		
		
	
	}

}