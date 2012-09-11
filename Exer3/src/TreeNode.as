package  
{
	/**
	 * ...
	 * @author arneil mercado
	 */
	public class TreeNode extends Sprite
	{	
		private var _collapseIcon:Collapser;
		private var _height:int;
		private var _depth:int;
		private var _treeNodeList:TreeNodeList;
		private var _treeNode:NodeData; //id ang title
		private var _collapse:Boolean; //toggle collapse
		
		private function loadMXL(xml:XML):void { }
		
		private function draw():void { }//draw node
		
		private function collapseNode():void { }
		
		private function slideNode(e:Event):void { }
		private function clickNode(e:Event):void { }
		private function changeNode(e:Event):void { }
		
		
		private function mouseOver(e:Event):void { }
		private function mouseOut(e:Event):void { }
		
		
		public function TreeNode() {}
		
		
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