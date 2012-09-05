package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author arneil mercado
	 */
	public class Module extends Sprite 
						implements IRunner
	{	
		// TODO: Do not initialize here. Put this logic inside initialize().
		private var _runner:Sprite = new Sprite();
		private var _goingRight:Boolean;
		private var _stop:Boolean;
		private var _x:int;
		private var _y:int;
		
		// BUG: This class, when removed, still has the enter_frame running in the background (memory leak). Create a function destroy (add it to the interface).
		public function Module():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
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
			_x = 0;
			_y = 100;
			_stop = true;
			draw();
		}
		
		// TODO: This should be public. Take note that this class may be called more than once so avoid putting addEventListeners here and addChild.
		// TODO: Avoid also redrawing graphics inside draw. Move this to a protected method for creating runner object.
		private function draw():void
		{
			
			_runner.graphics.beginFill(0xFF0000);
			_runner.graphics.drawRect(0, 0, 40, 40);
			_runner.x = _x;
			_runner.y = _y;
			_runner.graphics.endFill();
			_runner.buttonMode = false;
			// TODO: When adding listeners, always set weakReference=true (5th param)
			stage.addEventListener(Event.ENTER_FRAME, run);
			addChild(_runner);
		}
		
		// TODO: Do not forget to format your code using Ctrl+Shift+2
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