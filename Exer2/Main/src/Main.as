package 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.StyleSheet;
	import flash.text.TextField;
	import flash.net.URLRequest;
    import flash.display.Loader;
	import flash.events.IOErrorEvent;

	
	/**
	 * ...
	 * @author arneil mercado
	 */
	public class Main extends Sprite 
	{	
		private const LOAD:String = "load";
		private const STOP:String = "stop";
		private const REMOVE:String= "remove";

		private var _myLoader:Loader;
		
		private var _externalSwf:IRunner;
	//	private var _externalModule:Module;
		
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
		private var _txtStatus:TextField;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{	
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(LOAD, Loaded, false, 0, true);
			
			
			// entry point
			
			initialize();
		}
		
		private function initialize():void 
		{
			_isLoaded = false;
			createChildren();
			draw();
		}
		
		private function draw():void
		{	
			_y = 10;
			_x = 50;
			var y:int = _y + 30;
			
			_load.x = _x;
			_load.y = _y;
			
			_txtLoad.x = _x;
			_txtLoad.y = y;
			
			_x += 110;
			_play.x = _x;
			_play.y = _y;
			
			_txtPlay.x = _x;
			_txtPlay.y = y;
			
			_x += 110;
			_txtStop.x = _x;
			_txtStop.y = y;
			
			_stop.x = _x;
			_stop.y = _y;
			
			_x += 110;
			_txtRemove.x = _x;
			_txtRemove.y = y;
			
			_remove.x = _x;
			_remove.y = _y;
			
			_txtStatus.text = "Unloaded";
			_txtStatus.x = _x + 120;
			_txtStatus.y = y;
			_txtStatus.width = 300;
			_txtStatus.height=20;
			
		}
		
		
		private function createChildren():void
		{
			_load = createButton(load);
			_txtLoad = createTextField("Load");

			
			_play = createButton(play);
			_txtPlay = createTextField("Play");
			
			
			_stop = createButton(stop); 
			_txtStop = createTextField("Stop");
			

			_remove = createButton(remove);
			_txtRemove =createTextField("Remove");
			
			_txtStatus = createTextField("Status");
			
			addChild(_load);
			addChild(_play);
			addChild(_stop);
			addChild(_remove);
			
			//labels
			addChild(_txtLoad);
			addChild(_txtPlay);
			addChild(_txtStop);
			addChild(_txtRemove);
			addChild(_txtStatus);
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
			button.addEventListener(MouseEvent.CLICK, listener,false,0,true);

			return button;
		}
		
		protected function createTextField(name:String):TextField
		{
			var txt:TextField = new TextField;
			txt.text = name;
	
			return txt;
		}
		
		private function load(e:Event):void
		{
			if (!_isLoaded)
			{
				trace("load");
				// TODO: Missing semi colon
				// =__=
				_myLoader = new Loader();
				var url:URLRequest = new URLRequest("Module.swf"); 
				_myLoader.load(url);
				_myLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, getContent, false, 0, true);
				_myLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, errorHandler, false, 0, true);
				
				dispatchEvent(new Event(LOAD));
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
				// TODO: Remove. No need
				dispatchEvent(new Event(STOP));
				_externalSwf.stop();
			}
		}
		
		private function remove(e:Event):void
		{	
			if (_isLoaded) 
			{	
				_externalSwf.stop();
				_externalSwf.destroy();
				removeChild(_externalSwf as DisplayObject);
				// TODO: Remove. No need
				dispatchEvent(new Event(REMOVE));
				_isLoaded = false;
				
				
			}
		}
		
		private function getContent(e:Event):void
		{	
			_externalSwf = e.target.content as IRunner;
			_isLoaded = true;
			addChild(_externalSwf as DisplayObject);
			
			// TODO: Remove. No need
			addEventListener(STOP, Stopped, false, 0, true);
			// TODO: Remove. No need
			addEventListener(REMOVE, Removed, false, 0, true);
			
			_myLoader = null;
		}
		
		private function errorHandler(e:Event):void
		{
			trace("ERROR.File not found.");
		}
		
		
		private function Loaded(e:Event):void
		{
			_txtStatus.text = "Loaded";
		}
		
		private function Stopped(e:Event):void
		{
			_txtStatus.text = "Stopped";
		}
		
		private function Removed(e:Event):void
		{
			_txtStatus.text = "Removed";
		}
		
		private function Played(e:Event):void
		{
			_txtStatus.text = "Removed";
		}
		
		
		
	}
	
}