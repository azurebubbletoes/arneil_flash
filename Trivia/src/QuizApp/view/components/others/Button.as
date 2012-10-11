package QuizApp.view.components.others
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.display.Shape;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	/**
	 * ...
	 * @author arneil mercado
	 */
	public class Button extends Sprite
	{
		private var _label:String;
		//	private var _hasNodes:Boolean;
		private var _txt:TextField;
		private var _txt2:TextField;
		private var _mc:MovieClip;
		private var _mc2:MovieClip;
		private var _bgWhite:Shape;
		private var _tf:TextFormat;
		private var _tf2:TextFormat;
		private var _w:Number
		
		private var _btn:SimpleButton;
		
		public function Button(val:String, w:Number) // , hasNodes:Boolean = false)
		{
			
			this.label = val;
			_w = w;
			//	this.hasNodes = hasNodes;
			initialize();
			draw();
		}
		
		private function initialize():void
		{
		
		}
		
		public function draw():void
		{
			_bgWhite = createShapeRect(0xFFFFFF);
			_tf = createTextFormat(0x555555);
			_tf2 = createTextFormat(0x0000FF);
			
			//var name:String=(hasNodes ? "+" : "-") + " " + this.label + "";
			var name:String = this.label;
			_txt = createTextField(_tf, name);
			_txt2 = createTextField(_tf2, name);
			
			_mc = createMovieClip(_bgWhite, _txt);
			_mc2 = createMovieClip(_bgWhite, _txt2);
			
			_btn = new SimpleButton();
			
			_btn.upState = _mc;
			_btn.overState = _mc2;
			_btn.hitTestState = _mc2;
			
			addChild(_btn);
		}
		
		public function get label():String
		{
			return _label;
		}
		
		public function set label(value:String):void
		{
			_label = value;
		}
		
		public function createTextFormat(color:uint):TextFormat
		{
			var tf:TextFormat = new TextFormat();
			tf.color = color
			tf.font = "Verdana";
			tf.size = 17;
			tf.align = "left";
			tf.leftMargin = 5;
			return tf;
		}
		
		public function createTextField(tf:TextFormat, text:String):TextField
		{
			var txt:TextField = new TextField();
			txt.text = text;
			txt.x = 0;
			txt.y = 0;
			txt.width = _bgWhite.width;
			txt.height = _bgWhite.height;
			txt.setTextFormat(tf);
			txt.autoSize = TextFieldAutoSize.LEFT;
			return txt;
		}
		
		public function createShapeRect(color:uint):Shape
		{
			var bg:Shape = new Shape();
			bg.graphics.beginFill(color, .1);
			bg.graphics.drawRect(0, 0, _w, 30);
			bg.graphics.endFill();
			return bg;
		}
		
		public function createMovieClip(shapeBG:Shape, tf:TextField):MovieClip
		{
			var clip:MovieClip = new MovieClip();
			clip.addChild(shapeBG);
			clip.addChild(tf);
			clip.x = 0;
			clip.y = 0;
			return clip;
		}
		
		/*public function get hasNodes():Boolean
		   {
		   return _hasNodes;
		   }
		
		   public function set hasNodes(value:Boolean):void
		   {
		   _hasNodes = value;
		 }*/
		
		public function toggleLabel(expand:Boolean):void
		{
			//var text:String = (expand ? "+" : "-") + " " + this.label + "";
			var text:String = this.label + "";
			_txt.text = text;
			_txt2.text = text;
			
			_txt.text = _txt2.text = text;
			_txt.setTextFormat(_tf);
			_txt2.setTextFormat(_tf2);
		
		}
	}

}
