package components.treeview
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.display.Shape;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	/**
	 * ...
	 * @author arneil mercado
	 */
	public class Button extends Sprite
	{
		public const HAS_NODES:String = "+";
		public const NO_NODES:String = "-";
		
		private var _holder:TextField;
		private var _icon:String;
		
		private var _title:TextField;
		private var _rectangle:Sprite;
		private var _label:String;
		public var _x:Number;
		public var _y:Number;
		public var _width:Number;
		public var _height:Number;
		
		public function Button(label:String, x:Number, y:Number, width:Number, height:Number, type:String = this.NO_NODES)
		{
			_x = x;
			_y = y;
			_width = width;
			_height = height;
			_label = label;
			_icon = type;
			
			draw();
			createChildren();
			addListeners();
		}
		
		private function draw():void
		{
			_title = new TextField();
			_rectangle = new Sprite();
			
			_rectangle = createRectangle(0xFFFFFF); //white background;black text
			_title = createText(0x000000);
			_holder = createHolder();
			//changeColor(0x000000);
		
		}
		
		private function createChildren():void
		{
			addChild(_holder);
			addChild(_title);
			addChild(_rectangle);
		}
		
		private function removeChildren():void
		{
			removeChild(_title);
			removeChild(_rectangle);
		}
		
		private function addListeners():void
		{
			this.addEventListener(MouseEvent.ROLL_OVER, rollOver);
			this.addEventListener(MouseEvent.ROLL_OUT, rollOut);
		
		}
		
		private function rollOver(e:Event):void
		{
			removeChildren();
			_rectangle = createRectangle(0x0000FF, .1); //blue background;white text
			_title = createText(0x000000);
			createChildren();
		}
		
		private function rollOut(e:Event):void
		{
			removeChildren();
			_rectangle = createRectangle(0xFFFFFF); //white background;black text
			_title = createText(0x000000);
			createChildren();
		}
		
		private function createRectangle(color:uint, alpha:Number = .1):Sprite
		{
			var rectangle:Sprite = new Sprite();
			rectangle.graphics.beginFill(color, alpha);
			rectangle.graphics.lineStyle(1, 0xFFFFFF);
			rectangle.graphics.drawRect(0, 0, _width, _height);
			rectangle.graphics.endFill();
			
			rectangle.buttonMode = true;
			rectangle.x = _x;
			rectangle.y = _y;
			return rectangle;
		}
		
		private function createText(color:uint):TextField
		{
			var title:TextField = new TextField();
			var txtFormat:TextFormat = new TextFormat("Arial", 25, color, false, null, null, null, null, TextFormatAlign.LEFT);
			title.defaultTextFormat = txtFormat;
			title.text = _label;
			title.x = _x + 20;
			title.y = _y;
			title.width = _width - 20;
			title.height = _height;
			return title;
		}
		
		private function createHolder():TextField
		{
			
			var label:TextField = new TextField();
			var txtFormat:TextFormat = new TextFormat("Arial", 25, 0x000000, false, null, null, null, null, TextFormatAlign.LEFT);
			label.defaultTextFormat = txtFormat;
			label.text = _icon;
			label.x = _x;
			label.y = _y;
			label.width = _width;
			label.height = _height;
			return label;
		}
		
		public function toggleIcon():void
		{	
			//removeChild(_holder);
			//_holder = createHolder();
			//_holder.text == this.HAS_NODES ? "-" : "+";
			//addChild(_holder);
		}
	}

}