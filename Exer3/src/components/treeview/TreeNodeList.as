package components.treeview
{	
	import flash.display.Sprite;
	/**
	 * ...
	 * @author arneil mercado
	 */
	public class TreeNodeList extends Sprite
	{
		private var _collapseIcon:Collapser;
		private var _nodes:Vector.<TreeNode>;
		
		public function TreeNodeList() {
				_nodes = new Vector.<TreeNode>();
		}
		public function add(t:TreeNode):void {
				_nodes[_nodes.length] = t;
		}
		public function clear():void {
			
			while (_nodes.length != 0) {
				var node:TreeNode = _nodes.pop();
				node.clear();
				removeChild(node);
			}
			
		}
		
		public function get nodes():Vector.<TreeNode> 
		{
			return _nodes;
		}
		
		public function set nodes(value:Vector.<TreeNode>):void 
		{
			_nodes = value;
		}
	}

}