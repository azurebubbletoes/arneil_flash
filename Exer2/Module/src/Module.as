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
		private const BOUNCE:String = "bounce";
		private const LEFT:String =   "left";
		private const RIGHT:String =  "right";
		
		
		private var _runner:Sprite;
		private var _goingRight:Boolean;
		private var _stop:Boolean;
		
		
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
			
			
			
			createChildren();
			draw();
			
		}
		
		private function createChildren():void
		{
			_runner = createRunner();
			addChild(_runner);
			stage.addEventListener(Event.ENTER_FRAME, run, false, 0, true);
		}
		
		public function draw():void
		{
			_runner.x =5;
			_runner.y = 100;
			// TODO: Move to initialize _runner = createRunner();
		}
		// TODO: Rename to createRunner
		protected function createRunner():Sprite
		{	
			
			var runner:Sprite = new Sprite();
			runner.graphics.beginFill(0xFF0000);
			runner.graphics.drawRect(0, 0, 40, 40);
			
			runner.graphics.endFill();
			runner.buttonMode = false;
			return runner;
		}
		

		private function run(e:Event):void
		{
			var add:int;
			if (!_stop)
			{	
				
				
				if (_goingRight)
				{
			
					_runner.x += 10;
					dispatchEvent(new Event(RIGHT));
					
					if (_runner.x + 40 >= stage.stageWidth) {
						dispatchEvent(new Event(BOUNCE));
						_goingRight = false;
					}
				}
				else
				{	
					_runner.x -= 10;
					dispatchEvent(new Event(LEFT));
					if (_runner.x <= 0) {
						dispatchEvent(new Event(BOUNCE));
						_goingRight = true;
		
					}
					
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