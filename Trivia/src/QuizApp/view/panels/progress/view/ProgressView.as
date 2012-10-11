package QuizApp.view.panels.progress.view
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
	
	import QuizApp.view.components.others.Button;
	
	public class ProgressView extends Sprite
	{
		public static var COMBOBOX_CLICKED:String = "COMBOBOX_CLICKED";
		public static var COMBOBOX_CHOSEN:String = "COMBOBOX_CHOSEN";
		//public static var LOAD:String = "CATEGORY_LOAD";
		//	public static var LOAD:String = "LOAD";
		public static var INIT:String = "PROGRESS_INIT";
		
		[Embed(source="../../../components/images/combo_arrow.png")]
		private var cArrow:Class;
		private var arrow:Bitmap = new cArrow();
		
		private var _container:Sprite;
		private var _display:Button;
		private var comboArrow:Sprite;
		private var _progressBarBG:Sprite;
		private var _progressBar:Sprite;
		private var _percentage:TextField;
		private var _points:TextField;
		
		public function ProgressView()
		{
			display = new Button("Select Category", 280);
			_percentage = new TextField();
			_points = new TextField();
			
			container = createContainer(300, 600);
			_progressBarBG = createContainer(260, 25, 0xD9FDFB);
			progressBar = createContainer(0, 25, 0xA6FDD8);
			
			draw();
			createChildren();
		}
		
		private function draw():void
		{
			_percentage.y = 530;
			_percentage.x = 20;
			_percentage.text = "0 %";
			
			_points.y = 530;
			_points.x = 210;
			_points.text = "Points: ";
			
			container.x = 500;
			
			display.x = 20;
			display.y = 10;
			
			arrow.x = 7;
			arrow.y = 18;
			
			_progressBarBG.x = 20;
			_progressBarBG.y = 560;
			
			progressBar.x = 20;
			progressBar.y = 560;
		}
		
		private function createChildren():void
		{
			//comboArrow.addChild(arrow);
			
			container.addChild(_points);
			container.addChild(_percentage);
			container.addChild(display);
			container.addChild(arrow);
			container.addChild(_progressBarBG);
			container.addChild(progressBar);
			addChild(container);
		
			//addChild(comboArrow);
		}
		
		public function createContainer(w:Number, h:Number, color:uint = 0xEFE4B0):Sprite
		{
			var shape:Sprite = new Sprite();
			
			shape.graphics.beginFill(color);
			shape.graphics.drawRect(0, 0, w, h);
			shape.graphics.endFill();
			
			return shape;
		}
		
		public function clickComboBox(e:MouseEvent):void
		{
			dispatchEvent(new Event(COMBOBOX_CLICKED, false, true));
		}
		
		public function clickDummyBox(e:MouseEvent):void
		{
			dispatchEvent(new Event("CATEGORY_SELECT", false, true));
		}
		
		public function get display():Button
		{
			return _display;
		}
		
		public function set display(value:Button):void
		{
			_display = value;
		}
		
		public function get container():Sprite
		{
			return _container;
		}
		
		public function set container(value:Sprite):void
		{
			_container = value;
		}
		
		public function get text():String
		{
			//return display 
			return display.label;
		}
		
		public function get progressBar():Sprite
		{
			return _progressBar;
		}
		
		public function set progressBar(value:Sprite):void
		{
			_progressBar = value;
		}
		
		public function get percentage():TextField
		{
			return _percentage;
		}
		
		public function set percentage(value:TextField):void
		{
			_percentage = value;
		}
		
		public function get points():TextField
		{
			return _points;
		}
		
		public function set points(value:TextField):void
		{
			_points = value;
		}
	
	}

}