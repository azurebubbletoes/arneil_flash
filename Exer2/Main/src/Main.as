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
		
		private var _txtPlay:TextField;
		private var _txtLoad:TextField;
		private var _txtRemove:TextField;
		private var _txtStop:TextField;
		
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
			
			_load=createButton(50, y, load);
			_play=createButton(140, y, play);
			_stop=createButton(250, y, stop);
			_remove=createButton(350, y, remove);
			
			_txtLoad=createTextField("Load",50, y);
			_txtPlay=createTextField("Play", 140, y);
			_txtStop=createTextField("Stop", 250, y);
			_txtRemove =createTextField("Remove", 350, y);
		
			addChild(_load);
			addChild(_play);
			addChild(_stop);
			addChild(_remove);
			
			//labels
			addChild(_txtLoad);
			addChild(_txtPlay);
			addChild(_txtStop);
			addChild(_txtRemove);
		}
		
		protected function createButton(x:int, y:int, listener:Function):Sprite
		{	
			var button:Sprite = new Sprite();
			
			button.graphics.beginFill(0xFFCC00);
			button.graphics.drawRect(x, y, 70, 30);
			button.graphics.endFill();
			
			button.useHandCursor = true;
			button.buttonMode = true;
			button.mouseChildren = false;
			button.addEventListener(MouseEvent.CLICK, listener);

			return button;
		}
		
		protected function createTextField(name:String,x:int, y:int):TextField
		{
			var txt:TextField = new TextField;
			txt.text = name;
			txt.x = x+20;
			txt.y = y + 30;
			return txt;
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