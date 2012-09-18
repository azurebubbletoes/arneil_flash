package components.treeview
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
		private var _hasNodes:Boolean;
		private var _txt:TextField;
		private var _mc:MovieClip;
		private var _bgWhite:Shape;
		private var _tf:TextFormat;
		
		public function Button(val:String, hasNodes:Boolean = false)
		{
			
			this.label = val;
			this.hasNodes = hasNodes;
			
			draw();
		}
		
		public function draw():void
		{
			_bgWhite = new Shape()
			_bgWhite.graphics.beginFill(0xFFFFFF);
			_bgWhite.graphics.drawRect(0, 0, 300, 30);
			_bgWhite.graphics.endFill();
			
			var bgBlue:Sprite = new Sprite();
			bgBlue.graphics.beginFill(0x62AAF2, .1);
			bgBlue.graphics.drawRect(0, 0, 300, 30);
			bgBlue.graphics.endFill();
			
			_tf = new TextFormat();
			_tf.color = 0x555555;
			_tf.font = "Verdana";
			_tf.size = 17;
			_tf.align = "left";
			_tf.leftMargin = 5;
			
			_txt = new TextField();
			_txt.text = (hasNodes ? "+" : "-") + " " + this.label + "";
			_txt.x = 0;
			_txt.y = 0;
			_txt.width = _bgWhite.width;
			_txt.height = _bgWhite.height;
			_txt.setTextFormat(_tf);
			_txt.autoSize = TextFieldAutoSize.LEFT;
			
			_mc = new MovieClip();
			_mc.addChild(_bgWhite);
			_mc.addChild(_txt);
			_mc.x = 0;
			_mc.y = 0;
			
			var btn:SimpleButton = new SimpleButton();
			btn.upState = _mc;
			btn.overState = bgBlue;
			
			btn.downState = btn.upState;
			btn.hitTestState = btn.upState;
			
			addChild(btn);
		}
		
		public function get label():String
		{
			return _label;
		}
		
		public function set label(value:String):void
		{
			_label = value;
		}
		
		public function get hasNodes():Boolean
		{
			return _hasNodes;
		}
		
		public function set hasNodes(value:Boolean):void
		{
			_hasNodes = value;
		}
		
		public function toggleLabel(expand:Boolean):void
		{
			
			//_mc.removeChild(_txt);
			
			_txt.text = (expand ? "+" : "-") + " " + this.label + "";
			_txt.x = 0;
			_txt.y = 0;
			_txt.width = _bgWhite.width;
			_txt.height = _bgWhite.height;
			_txt.setTextFormat(_tf);
			_txt.autoSize = TextFieldAutoSize.LEFT;
			//_mc.addChild(_txt);
		}
	}

}
