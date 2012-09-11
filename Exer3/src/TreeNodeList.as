package  
{
	/**
	 * ...
	 * @author arneil mercado
	 */
	public class TreeNodeList extends Sprite
	{
		private var _collapseIcon:Collapser;
		private var _treeNodes:Vector.<TreeNode>;
		private var _height:int; 
		private var _depth:int;
		
		
		private function draw():void {}//draw nodes
		private function loadMXL(xml:XML):void { }
		
		
		
		private function slideNodes(e:Event):void { }//
		private function collapseNodes(e:Event):void { }
		private function changeNodes(e:Event):void { }
		
		
		//
		public function TreeNodeList() {}
		
		public function get height():int 
		{
			return _height;
		}
		
		public function set height(value:int):void 
		{
			_height = value;
		}
		
		public function get depth():int 
		{
			return _depth;
		}
		
		public function set depth(value:int):void 
		{
			_depth = value;
		}
		
		
	}

}