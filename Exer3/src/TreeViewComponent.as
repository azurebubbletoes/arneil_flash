package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author arneil mercado
	 */
	public class TreeViewComponent extends Sprite
	{	
		private var _path:String = "xml/test.xml";//path sa tree
		private var _x:int;					  //starting x sa tree
		private var _y:int;                   //starting y sa tree
		private var _treeNodeList:TreeNodeList;   //root Node
		
		
		private var _breadCrumb:TextField;         //selected node;
		private var _breadCrumbLabel:TextField;     //label
		
		private function initialize():void{}
		private function draw():void {}
		private function createChildren():void { }
		private function handleMXL():void { }
		private function loadMXL(e:Event):void {}
		private function selectedNode(e:Event):void { }
		
		
		//getters,setters, constructor
		public function TreeViewComponent(path:String,x:int,y:int) 
		{
			this.x = x;
			this.y = y;
			this.path = path;
		}
		
		public function get path():String 
		{
			return _path;
		}
		
		public function set path(value:String):void 
		{
			_path = value;
		}
		
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
		
	
		
	}

}