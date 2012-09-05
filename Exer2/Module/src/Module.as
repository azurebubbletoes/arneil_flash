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
			
			_stop = true;
			draw();
		
			addChild(_runner);
		}
		
		public function draw():void
		{
			_x = 0;
			_y = 100;
			// TODO: Move to initialize _runner = createRunner();
			drawRunner();
			stage.addEventListener(Event.ENTER_FRAME, run, false, 0, true);
		
		}
		// TODO: Rename to createRunner
		protected function drawRunner():void
		{
			_runner = new Sprite();
			_runner.graphics.beginFill(0xFF0000);
			_runner.graphics.drawRect(0, 0, 40, 40);
			_runner.x = _x;
			_runner.y = _y;
			_runner.graphics.endFill();
			_runner.buttonMode = false;
		}
		

		private function run(e:Event):void
		{
			var add:int;
			if (!_stop)
			{
				if (_goingRight)
				{
					_runner.x += 10;
					
					if (_runner.x + 40 >= stage.stageWidth)
						_goingRight = false;
				}
				else
				{
					_runner.x -= 10;
					if (_runner.x <= 0)
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
		
		public function destroy():void
		{	
			
			stage.removeEventListener(Event.ENTER_FRAME, run);
		}
	
	}

}