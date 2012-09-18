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
		
		}
		
		public function initializeDepth(depth:Number):void
		{
			
			this.depth = depth;
			for (var i:int = 0; i < this.nodes.length; i++)
			{
				this.nodes[i].depth = depth;
				this.nodes[i].isExpanded = !(false || this.nodes[i].nodes.length == 0);
				if (this.nodes[i].hasNodes)
					this.nodes[i].nodes.initializeDepth(depth + 1);
			}
		}
		
		public function closeNodes(node:TreeNode):void
		{
			for (var i:int = 0; i < this.nodes.length; i++)
			{
				if (this.nodes[i].isExpanded)
				{
					if (!this.nodes[i].containsNode(node))
					{	
						
							this.nodes[i].button.toggleLabel(this.nodes[i].nodes.length == 0?false:true);
						
						this.nodes[i].removeNodes();
						this.nodes[i].treeViewComponent.adjustHeight(this.nodes[i]);
					}
					else
					{
						if (!this.nodes[i].equals(node))
							this.nodes[i].nodes.closeNodes(node);
					}
					
				}
				
			}
		
		}
		
		public function adjustHeight(node:TreeNode):void
		{
			trace("------------------------------------------------------");
			trace("entering the adjust function...");
			trace("entering the loop");
			trace("hasPassed:"+hasPassed);
			var hasPassed:Boolean=false
			for (var i:int = 0; i < this.nodes.length; i++)
			{
				trace("current depth:" +this.nodes[i].depth );
				trace("current node:" +this.nodes[i].name);
				
				if (hasPassed && !this.nodes[i].equals(node) && !this.nodes[i].containsNode(node)) {
					trace("entering hasPassed..");
					
					var height:Number=node.isExpanded?node.nodes.height:node.nodes.height * -1;
					this.nodes[i].y += height;// node.isExpanded?height - height:height + height;
					//this.nodes[i].y += node.isExpanded?node.nodes.height:node.nodes.height * -1;
					
					//new Tweener().moveTween(this.nodes[i], height, 10);
					
					trace("node y:" + this.nodes[i].y);
					trace("boundHeight: "+(node.isExpanded?node.nodes.height:node.nodes.height * -1) );
					
				}
				if (this.nodes[i].containsNode(node)) {
					trace("node " + this.nodes[i].name + " contains node:" + node.name);
					
					hasPassed = true;
					trace("hasPassed:"+hasPassed);
					if (!this.nodes[i].equals(node)){
							this.nodes[i].nodes.adjustHeight(node);
					
						trace("node " + this.nodes[i].name + " is not equal to node:" + node.name);
					}
				}
					
				
			}
			
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