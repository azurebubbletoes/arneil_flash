package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.StyleSheet;
	import flash.text.TextField;
	import flash.net.URLRequest;
    import flash.display.Loader;
	
	/**
	 * ...
	 * @author arneil mercado
	 */
	public class Main extends Sprite 
	{
		private var _myLoader:Loader = new Loader();                     
		private var _externalSwf:Object;
		private var _isLoaded:Boolean;
		
		private var _play:Sprite;
		private var _load:Sprite;
		private var _remove:Sprite;
		private var _stop:Sprite;
		
		public function Main():void 
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
			//load remove play stop
			var y:int = 10;
			_isLoaded = false;
			_load=createButton("Load", 50, y, load);
			_play=createButton("Play", 140, y, play);
			_stop=createButton("Stop", 250, y, stop);
			_remove=createButton("Remove", 350, y, remove);
			
			
		}
		
		protected function createButton(name:String, x:int, y:int, listener:Function):Sprite
		{	
			var button:Sprite = new Sprite();
			
			button.graphics.beginFill(0xFFCC00);
			button.graphics.drawRect(x, y, 70, 30);
			button.graphics.endFill();
			
			button.useHandCursor = true;
			button.buttonMode = true;
			button.mouseChildren = false;
			button.addEventListener(MouseEvent.CLICK, listener);
			
			addChild(button);
			
			
			var txt:TextField = new TextField;
			txt.text = name;
			txt.x = x+20;
			txt.y = y + 30;
		
			addChild(txt);
			return button;
		}
		
		private function load(e:Event):void
		{
			if (!_isLoaded)
			{
				trace("load");
				var url:URLRequest = new URLRequest("Module.swf"); 
				_myLoader.load(url);
				_myLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, getContent);
				addChild(_myLoader);
			}
		}
		
		private function play(e:Event):void
		{
			trace("play");
			if (_isLoaded) 
			{
				_externalSwf.play();
			}

		}
		
		private function stop(e:Event):void
		{
			trace("stop");
			if (_isLoaded) 
			{
				_externalSwf.stop();
			}
		}
		
		private function remove(e:Event):void
		{	
			//_externalSwf.removeChild();
			if (_isLoaded) 
			{
				_externalSwf.stop();
				removeChild(_myLoader);
				_isLoaded = false;
			}
		}
		
		private function getContent(e:Event):void
		{	
			_externalSwf = e.target.content;
			_isLoaded = true;
		}
		
	}
	
}