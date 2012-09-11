package components.treeview
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.display.Shape;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author arneil mercado
	 */
	public class Container extends Sprite
	{
		
		private var _title:TextField;
		private var _rectangle:Shape;
		private var _rectangleSprite:Sprite;
		private var button:CustomButton;
		
		public function Container(str:String)
		{
			
			button = new CustomButton(str);
			button.buttonMode = true;
			button.x = 50;
			button.y = 50;
			button.upColor = 0x00FF00;
			button.downColor = 0xFFFFFF;
			
			button.addEventListener(MouseEvent.MOUSE_OVER, mouseOver,false,0,true);
			
			addChild(button);
		
		}
		
		public function mouseOver(e:Event):void
		{
			//(e.currentTarget as CustomButton).hitArea.alpha = .5;
		}
	
	}

}