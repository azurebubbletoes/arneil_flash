package panels.question.view
{
	/**
	 * ...
	 * @author arneil mercado
	 */
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	import flash.events.MouseEvent;
	import flash.events.Event;
	import others.Button;
	
	public class QuestionView extends Sprite
	{
		public static var INIT:String = "QUESTION_INIT";
		public static var LOAD:String = "QUESTION_LOAD";
		
		private var _question:TextField;
		
		private var _choices:Sprite;
		private var _a:Button;
		private var _b:Button;
		private var _c:Button;
		private var _d:Button;
		
		private var background:Sprite;
		
		private var _questionname:String
		private var _choicesArray:Array;
		
		private var _answer:String;
		private var _category:String;
		
		public function QuestionView()
		{
			_questionname = "No Category Selected.";
			_choices = new Sprite();
			_choicesArray = new Array(" ", " ", " ", " ");
			
			draw();
			createChildren();
		
		}
		
		public function draw():void
		{
			background = createContainer(500, 600, 0xF4DBA6);
			_question = createTextField(questionname);
			
			a = new Button(choicesArray[0], 400);
			b = new Button(choicesArray[1], 400);
			c = new Button(choicesArray[2], 400);
			d = new Button(choicesArray[3], 400);
			
			background.x = 0;
			background.y = 0;
			
			question.x = 20;
			question.y = 30;
			
			choices.x = 30;
			choices.y = 300;
			
			_a.x = 0;
			_a.y = 0;
			
			_b.x = 0;
			_b.y = 30;
			
			_c.x = 0;
			_c.y = 60
			
			_d.x = 0;
			_d.y = 90;
		
		}
		
		private function createChildren():void
		{
			choices.addChild(_a);
			choices.addChild(_b);
			choices.addChild(_c);
			choices.addChild(_d);
			
			addChild(background);
			addChild(question);
			addChild(choices);
		}
		
		public function createTextField(text:String):TextField
		{
			var tf:TextFormat = new TextFormat();
			tf.color = 0x000000;
			tf.font = "Verdana";
			tf.size = 17;
			tf.align = "left";
			tf.leftMargin = 5;
			
			var txt:TextField = new TextField();
			txt.text = text;
			txt.x = 0;
			txt.y = 0;
			txt.width = 460;
			txt.height = 300;
			txt.setTextFormat(tf);
			txt.condenseWhite = true;
			txt.multiline = true;
			txt.wordWrap = true;
			txt.autoSize = TextFieldAutoSize.LEFT;
			return txt;
		}
		
		public function get question():TextField
		{
			return _question;
		}
		
		public function set question(value:TextField):void
		{
			_question = value;
		}
		
		public function get choices():Sprite
		{
			return _choices;
		}
		
		public function set choices(value:Sprite):void
		{
			_choices = value;
		}
		
		public function get a():Button
		{
			return _a;
		}
		
		public function set a(value:Button):void
		{
			_a = value;
		}
		
		public function get b():Button
		{
			return _b;
		}
		
		public function set b(value:Button):void
		{
			_b = value;
		}
		
		public function get c():Button
		{
			return _c;
		}
		
		public function set c(value:Button):void
		{
			_c = value;
		}
		
		public function get d():Button
		{
			return _d;
		}
		
		public function set d(value:Button):void
		{
			_d = value;
		}
		
		public function get questionname():String
		{
			return _questionname;
		}
		
		public function set questionname(value:String):void
		{
			_questionname = value;
		}
		
		public function get choicesArray():Array
		{
			return _choicesArray;
		}
		
		public function set choicesArray(value:Array):void
		{
			_choicesArray = value;
		}
		
		public function get answer():String
		{
			return _answer;
		}
		
		public function set answer(value:String):void
		{
			_answer = value;
		}
		
		public function get category():String
		{
			return _category;
		}
		
		public function set category(value:String):void
		{
			_category = value;
		}
		
		private function createContainer(w:Number, h:Number, color:uint = 0xEFE4B0):Sprite
		{
			var shape:Sprite = new Sprite();
			
			shape.graphics.beginFill(color);
			shape.graphics.drawRect(0, 0, w, h);
			shape.graphics.endFill();
			
			return shape;
		}
	
	}

}