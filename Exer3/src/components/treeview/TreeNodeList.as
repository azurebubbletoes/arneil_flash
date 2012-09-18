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
		private var _depth:int;
		private var _isCreated:Boolean;
		
		public function TreeNodeList()
		{
			this.nodes = new Vector.<TreeNode>();
		}
		
		public function createNodes():void
		{
			
			_isCreated = true;
			
			var y:Number = 0;
			var x:Number = 0;
			
			for (var i:int = 0; i < this.nodes.length; i++, y += 30)
			{
				this.nodes[i].y = y;
				this.nodes[i].x = x;
				this.nodes[i].draw();
				//this.nodes.nodes[i].addEventListener(TreeEvent.NODE_ADJUST, this.treeViewComponent.adjustHeight, false, 0, true);
				addChild(this.nodes[i]);
			}
			//this.y -= 20;
			//new Tweener().moveTween(this, this.y + 20, 10);
		
		}
		
		public function get boundHeight():Number
		{
			return this.height;
		}
		
		public function get nodes():Vector.<TreeNode>
		{
			return _nodes;
		}
		
		public function set nodes(value:Vector.<TreeNode>):void
		{
			_nodes = value;
		}
		
		public function get length():Number
		{
			return this.nodes.length;
		}
		
		public function get isCreated():Boolean
		{
			return _isCreated;
		}
		
		public function get depth():Number
		{
			return _depth
		}
		
		public function set depth(value:Number):void
		{
			_depth = value;
		}
		
		public function pop():TreeNode
		{
			return this.nodes.pop();
		}
		
		public function push(node:TreeNode):void
		{
			this.nodes.push(node);
		}
	}

}