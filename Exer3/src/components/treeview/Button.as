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
		
		public function Button(val:String, hasNodes:Boolean = false)
		{
			
			this.label = val;
			this.hasNodes = hasNodes;
			
			draw();
		}
		
		public function draw():void
		{
			var bgWhite:Shape = new Shape()
			bgWhite.graphics.beginFill(0xFFFFFF);
			bgWhite.graphics.drawRect(0, 0, 300, 30);
			bgWhite.graphics.endFill();
			
			var bgBlue:Sprite = new Sprite(); 
			bgBlue.graphics.beginFill(0x62AAF2,.1);
			bgBlue.graphics.drawRect(0,0, 300, 30);
			bgBlue.graphics.endFill();
			
			var tf:TextFormat = new TextFormat();
			tf.color = 0x555555;
			tf.font = "Verdana";
			tf.size = 17;
			tf.align = "left";
			tf.leftMargin = 5;
			
			var txt:TextField = new TextField();
			txt.text = (hasNodes?"+":"-") +" "+this.label+"";
			txt.x = 0;
			txt.y = 0;
			txt.width = bgWhite.width;
			txt.height = bgWhite.height;
			txt.setTextFormat(tf);
			txt.autoSize =TextFieldAutoSize.LEFT;
			
			var mc:MovieClip = new MovieClip();
			mc.addChild(bgWhite);
			mc.addChild(txt);
			mc.x =0;
			mc.y = 0;
			
			
			var btn:SimpleButton = new SimpleButton();
			btn.upState = mc;
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
	
	}

}
