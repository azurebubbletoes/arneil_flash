package  
{
	/**
	 * ...
	 * @author arneil mercado
	 */
	public class TreeNode 
	{	
		private var _height:int;
		private var _depth:int;
		private var _treeNodeList:TreeNodeList;
		private var _treeNode:NodeData; //id ang title
		private var _collapse:Boolean; //the node is collapseD?
		
		
		public function TreeNode() {}
		private function loadMXL(xml:XML):void { }
		
		private function draw():void { }
		private function collapseNode():void {}
		
		private function clickNode(e:Event):void { }
		private function changeNode(e:Event):void { }
		
		private function mouseOver(e:Event):void { }
		private function mouseOut(e:Event):void{}
	}

}