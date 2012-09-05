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
		// TODO: Do not initialize the loader here. Move this inside load method.
		private var _myLoader:Loader = new Loader();                     
		// TODO: Change data type to IRunner
		private var _externalSwf:Object;
		private var _isLoaded:Boolean;
		private var _x:int;
		private var _y:int;
		
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
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			initialize();
		}
		
		private function initialize():void 
		{
			// TODO: Move this inside draw()
			 _y = 10;
			 _x = 50;
			_isLoaded = false;
			
			// TODO: Rename to createChildren()
			addChildren();
			// TODO: Midding draw() method
		}
		
		private function addChildren():void
		{
			_load = createButton(load);
			_load.x = _x;
			_load.y = _y;
			_txtLoad = createTextField("Load");
			_x += 110;
			
			_play = createButton(play);
			_play.x = _x;
			_play.y = _y;
			_txtPlay = createTextField("Play");
			
			_x += 110;
			_stop = createButton(stop); 
			_stop.x = _x;
			_stop.y = _y;
			_txtStop = createTextField("Stop");
			
			_x += 110;
			_remove = createButton(remove);
			_remove.x = _x;
			_remove.y = _y;
			_txtRemove =createTextField("Remove");
			
			
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
		
	
		
		protected function createButton(listener:Function):Sprite
		{	
			var button:Sprite = new Sprite();
			
			button.graphics.beginFill(0xFFCC00);
			button.graphics.drawRect(0, 0, 70, 30);
			button.graphics.endFill();
			button.useHandCursor = true;
			button.buttonMode = true;
			button.mouseChildren = false;
			// TODO: When adding listeners, always set weakReference=true (5th param)
			button.addEventListener(MouseEvent.CLICK, listener);

			return button;
		}
		
		protected function createTextField(name:String):TextField
		{
			var txt:TextField = new TextField;
			txt.text = name;
			// TODO: Move this inside draw()
			txt.x = _x+20;
			txt.y = _y + 30;
	
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
				// TODO: Always listen for IOErrorEvent.IO_ERROR if you're loading something, in case, it cannot find the file
				// TODO: Do not add the loader to the display list. You'll only need the content (IRunner) and that's what you're going to add to the display list.
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
			// TODO: Midding type cast to IRunner
			_externalSwf = e.target.content;
			_isLoaded = true;
			
			// TODO: Once you've acquired the loader content, do not forget to dispose the loader.
		}
		
	}
	
}