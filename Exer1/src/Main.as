package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.display.Graphics;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author arneil mercado
	 */
	public class Main extends Sprite
	{
		private var _txtField:TextField = new TextField();
		private var txtError:TextField = new TextField();
		private var _button:Sprite;
		private var _bErrorMsg:Boolean = false;
		
		
		
		public function Main():void
		{	
			
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{	
			CreateTextField();
			CreateButton();
			CreateMsg("");
			removeEventListener(Event.ADDED_TO_STAGE, init);
			

		}
	
		private function CreateButton():void
		{
			//button
			_button = new Sprite();
			_button.graphics.beginFill(0xFFCC00);
			_button.graphics.drawRect(100, 50, 70, 30);
			_button.graphics.endFill();
			
			_button.useHandCursor = true;
			_button.buttonMode = true;
			_button.mouseChildren = false;
			_button.addEventListener(MouseEvent.CLICK, ButtonHandler);
			
			addChild(_button);
			
		}
		
		private function CreateTextField():void 
		{	
			_txtField.text = "";
			_txtField.border = true;
			_txtField.borderColor = 0xAAAAAA;
			_txtField.type = "input";
			_txtField.width = 30;
			_txtField.height = 30;
			_txtField.x = 50;
			_txtField.y = 50;
			var format:TextFormat = new TextFormat();
			format.size = 26;
			_txtField.setTextFormat(format);
			
			addChild(_txtField);
			
		}
		
		private function ButtonHandler(e:Event):void 
		{
			var msg:String = "";
			trace("clicked");
			
			if (!isNaN(parseInt(_txtField.text)))
			{
				
				CreateDisplay();
				msg = "ERROR. ID not found.";
			}else 
			{
				msg = "ERROR. Input is not an integer";
				_bErrorMsg = true;
			}
			
			
			if (_bErrorMsg) {
				txtError.text = msg;
				txtError.border = true;
				txtError.borderColor = 0xFF0000; //red
			}else {
				txtError.text = msg;
				txtError.border = false;
				txtError.borderColor = 0x000000; //red
			}
				
		}
		
		private function CreateMsg(msg:String):void
		{	
			txtError.width = 500;
			txtError.height = 30;
			txtError.x = 200;
			txtError.y = 50;
			var format:TextFormat = new TextFormat();
			format.size = 20;
			format.color = 0xFF0000;
			txtError.setTextFormat(format);
			addChild(txtError);
			
		}
		
		private function CreateDisplay():void 
		{
			var loader:URLLoader = new URLLoader(  );
			loader.dataFormat = "xml";
			loader.addEventListener( Event.COMPLETE, handleXML );
			loader.load( new URLRequest( "xml/exercise1.xml" ) );
		}
		
		private function handleXML( event:Event ):void 
		{
		  try {
			
			// Convert the downlaoded text into an XML instance
			var xml:XML = new XML( event.target.data );
			// At this point, example is ready to be used with E4X
			var id:int = parseInt(_txtField.text);
			var val:String = xml.heroes.hero[id-1].name;
		   if(id>0 && id-1<xml.heroes.hero.length()){
				txtError.text = "";
				txtError.border = false;
				
				//display na!
				
				
				
				
		   }else {
			   txtError.border = true;
				txtError.borderColor = 0xff0000; //red
			   }
			  
			
		  } catch ( e:TypeError ) {
			// If we get here, that means the downloaded text could
			// not be converted into an XML instance, probably because 
			// it is not formatted correctly.
			trace( "Could not parse text into XML" );
			trace( e.message );
			_bErrorMsg = true;
			  txtError.border = true;
			txtError.borderColor = 0xff0000; //red
		  }
		}
	
	
		
	}

}