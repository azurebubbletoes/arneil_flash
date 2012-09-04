package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.StyleSheet;
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
		private var style:StyleSheet= new StyleSheet();
		private var guivariables: Array = [];
		
		
		public function Main():void
		{	
			
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{	
			CreateGUI();
			
			
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
		
		private function CreateGUI():void 
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
			
			var txtLabel:TextField = new TextField();
			var css:String = "Label { font-family: Arial; font-size: 16px; font-weight: bold; color: #223166; text-align: left; } ";
			
			style.parseCSS(css);
			txtLabel.styleSheet = style;
			
			txtLabel.x = 100;
			txtLabel.y = 100;
			txtLabel.htmlText="<Label>Hero Info:</Label>"
			addChild(txtLabel);
			
			CreateButton();
			CreateMsg("");
			guivariables = new Array();
			
		}
		
		private function ButtonHandler(e:Event):void 
		{
			Reset();
			
			var msg:String = "";
			txtError.text = msg;
			txtError.border = false;
			txtError.borderColor = 0x000000; 
				
			
			if (!isNaN(parseInt(_txtField.text)))
			{
				
				CreateDisplay();
				msg = "ERROR. ID not found.";
			}else 
			{
				msg = "ERROR. Input is not an integer";
				_bErrorMsg = true;
			}
			
			
			if (_bErrorMsg) 
			{
				txtError.text = msg;
				txtError.border = true;
				txtError.borderColor = 0xFF0000; //red
		
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
			loader.addEventListener( Event.COMPLETE, HandleXML );
			loader.load( new URLRequest( "xml/exercise1.xml" ) );
		}
		
		private function HandleXML( event:Event ):void 
		{
		  try{
			
		
			var xml:XML = new XML( event.target.data );
			
			var id:int = parseInt(_txtField.text);
			var val:String = xml.heroes.hero[id-1].name;
		   if (id > 0 && id - 1 < xml.heroes.hero.length())
		   {
				txtError.text = "";
				txtError.border = false;
				
				Display(xml,id);
				
				
		   }else {
		
			   
			   txtError.border = true;
			   txtError.borderColor = 0xff0000; //red
		
			}
			  
			
		  } catch ( e:TypeError ) {
			trace( "Could not parse text into XML" );
			trace( e.message );
			
			txtError.text = "ERROR. ID not found.";
			_bErrorMsg = true;
			  txtError.border = true;
			txtError.borderColor = 0xff0000; //red
		  }
		  
		}
	
		private function Display(xml:XML,id:int):void 
		{
			id = --id;
			var x:int = 100;
			var y:int = 130;
			var val:String = "Value";
			var pro:String ="Property";
			var css:String = "Property { font-family: Arial; font-size: 12px; font-weight: bold; color: #FF0000; text-align: left; } ";
			css+="Value{ font-family: Arial; font-size: 12px; font-weight: normal; color: #CCCCCC; text-align: left; } ";
			style.parseCSS(css);
			
			CreateTextField("Hero Name:",x,y,css,pro);
			CreateTextField(xml.heroes.hero[id].name, x + 100, y, css, val);
			
			CreateTextField("Hero Level:",x,y+=20,css,pro);
			CreateTextField(xml.heroes.hero[id].level, x + 100, y, css, val);	
			
			CreateTextField("Hero Type:",x,y+=20,css,pro);
			CreateTextField(xml.heroTypes.heroType[xml.heroes.hero[id].heroType.@id-1], x + 100, y, css, val);	
			
			CreateTextField("Spells:",x,y+=30,css,"Label");
			y += 30;
			
			
			for (var i:int = 0; i < xml.heroes.hero[id].spells.spell.length(); i++,y+=30 ) 
			{
				
				CreateTextField("Spell Name:",x,y,css,pro);
				CreateTextField(xml.spells.spell[xml.heroes.hero[id].spells.spell[i].@id-1].name, x + 100, y, css, val);	
			
				//spell properties
				CreateTextField("Manacost :",x,y+=20,css,val);
				CreateTextField(xml.spells.spell[xml.heroes.hero[id].spells.spell[i].@id - 1].manacost, x + 100, y, css, val);	
				
				CreateTextField("Target Attributes :", x, y += 20, css, val);

				var AttributeLength:int = xml.spells.spell[xml.heroes.hero[id].spells.spell[i].@id - 1].targetAttributes.targetAttribute.length();
				
				for (var j:int = 0; j <AttributeLength ;j++,y+=20 ) 
					CreateTextField(xml.attributes.attribute[xml.spells.spell[xml.heroes.hero[id].spells.spell[i].@id-1].targetAttributes.targetAttribute[j].@id-1], x + 100, y, css, val);	
				
				
				CreateTextField("Effect :",x,y,css,val);
				CreateTextField(xml.spells.spell[xml.heroes.hero[id].spells.spell[i].@id-1].effect, x + 100, y, css, val);
			}
			
			//addChild(guivariables);
		}
		
		private function CreateTextField(innerhtml:String, x:int, y:int, css:String, tag:String):void 
		{
			
			var txtName:TextField = new TextField();
			
			txtName.styleSheet = style;
			txtName.x = x;
			txtName.y = y;
			txtName.width=200;
			txtName.htmlText = "<"+tag+">" + innerhtml + "</"+tag+">";

			addChild(txtName);
			guivariables.push(txtName);
		}
		
		private function Reset():void 
		{
			while (guivariables.length)
			{
				var j:TextField=guivariables.pop();
				removeChild(j);
			}
				
		}
		
		
	}

}