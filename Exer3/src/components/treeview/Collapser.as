package components.treeview
{
	import flash.display.Shape;
	
	/**
	 * ...
	 * @author arneil mercado
	 */
	public class Collapser extends Sprite
	{
		private var _icon:String;
		private var _rect:Shape;
		private var _iconState:Boolean;
		private var _x:int;
		private var _y:int;
		private var _height:int;
		private var _width:int;
		
		public function Collapser() {}
		
		private function initialize():void{}//draw
		private function toggleIcon():void{}
		
		public function get x():int 
		{
			return _x;
		}
		
		public function set x(value:int):void 
		{
			_x = value;
		}
		
		public function get y():int 
		{
			return _y;
		}
		
		public function set y(value:int):void 
		{
			_y = value;
		}
		
		public function get height():int 
		{
			return _height;
		}
		
		public function set height(value:int):void 
		{
			_height = value;
		}
		
		public function get width():int 
		{
			return _width;
		}
		
		public function set width(value:int):void 
		{
			_width = value;
		}
		
	}

}