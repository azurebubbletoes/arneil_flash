package components.treeview 
{	
	import flash.display.Sprite;
	/**
	 * ...
	 * @author arneil mercado
	 */
	public class TreeNodeList extends Sprite
	{
		private var _nodes:Vector.<TreeNode>;
		
		public function TreeNodeList() 
		{
			this.nodes = new Vector.<TreeNode>();
		}
		
		public function get nodes():Vector.<TreeNode> 
		{
			return _nodes;
		}
		
		public function set nodes(value:Vector.<TreeNode>):void 
		{
			_nodes = value;
		}
		
		public function get length():Number {
			return this.nodes.length;
		}
		
		public function pop():TreeNode {
			return this.nodes.pop();	
		}
		
		public function push(node:TreeNode):void {
			this.nodes.push(node);
		}
	}

}