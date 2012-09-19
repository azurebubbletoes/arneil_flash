package components.treeview
{
	import flash.display.Sprite;
	import components.treeview.TreeEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.EventDispatcher;
	
	/**
	 * ...
	 * @author arneil mercado
	 */
	public class TreeViewComponent extends Sprite
	{
		private var _startX:Number;
		private var _startY:Number;
		
		private var _horizontalIndent:Number;
		
		private var _useTween:Boolean;
		
		private var _tweenEasing:Number;
		private var _autoCollapseWhenNotViewed:Boolean;
		
		private var _nodes:Vector.<TreeNode>;
		private var _nodeContainerSprite:Sprite;
		
		private var _leafNodeAlwaysOpen:Boolean;
		private var _leafToOpen:int;
		
		public function TreeViewComponent()
		{
			
			initialize();
		}
		
		private function initialize():void
		{
			//-------------------
			_autoCollapseWhenNotViewed = false;
			_leafNodeAlwaysOpen = false;
			_leafToOpen = 0; //default opened leaf if  leafNodeAlwaysOpen
			
			
			_startX = 50;
			_startY = 50;
			_horizontalIndent = 10;
			
			_tweenEasing = 15;
			
			_nodeContainerSprite = new Sprite();
			_nodes = new Vector.<TreeNode>();
			
			addChild(_nodeContainerSprite);
		
		}
		
		public function draw():void
		{
			var y:Number = _startY;
			for (var i:int = 0; i < _nodes.length; i++, y += 30)
			{
				this.nodes[i].initializeDepth(0);
				this.nodes[i].x = _startX;
				this.nodes[i].y = y;
				this.nodes[i].drawButton();
				
				_nodeContainerSprite.addChild(this.nodes[i]);
				
			}
			if (this.leafNodeAlwaysOpen)
				openLeaf();
		}
		
		internal function closeNodes(node:TreeNode):void
		{
			
			for (var i:int = 0; i < this.nodes.length; i++)
			{
				if (this.nodes[i].isExpanded)
				{
					if (!this.nodes[i].containsNode(node))
					{
						
						if (!(node.nodes.length == 0 && this.nodes[i].depth == node.depth) && autoCollapseWhenNotViewed) // && (!_leafNodeAlwaysOpen || (leafNodeAlwaysOpen && !isLeaf(nodes[i]))))) // previous node wont close when wlay subnodes and chosen nodes
						{
							if (!this.isLeaf(nodes[i]))
							{
								this.nodes[i].button.toggleLabel(this.nodes[i].nodes.length == 0 ? false : true);
								this.nodes[i].removeNodes();
								adjustHeight(this.nodes[i]);
							}
						}
						
					}
					else
					{
						if (!this.nodes[i].equals(node))
							this.nodes[i].closeNodes(node);
					}
					
				}
					//}
				
			}
		}
		
		internal function adjustHeight(node:TreeNode):void
		{
			
			var hasPassed:Boolean = false;
			for (var i:int = 0; i < this.nodes.length; i++)
			{
				
				if (hasPassed && !this.nodes[i].equals(node) && !this.nodes[i].containsNode(node))
				{
					
					var height:Number = node.isExpanded ? node.nodeContainerSprite.height : node.nodeContainerSprite.height * -1;
					this.nodes[i].y += height;
					
				}
				if (this.nodes[i].containsNode(node))
				{
					
					hasPassed = true;
					
					if (!this.nodes[i].equals(node))
						this.nodes[i].adjustHeight(node);
				}
				
			}
		
		}
		
		internal function isLeaf(node:TreeNode):Boolean
		{
			var isPath:Boolean = true;
			
			if (leafNodeAlwaysOpen)
			{
				var nodeVector:Vector.<TreeNode> = new Vector.<TreeNode>();
				nodeVector = nodes;
				while (isPath)
				{
					
					if (nodeVector[leafToOpen].containsNode(node))
					{
						if (nodeVector[leafToOpen].equals(node))
						{
							isPath = false;
							break;
						}
						else
						{
							nodeVector = nodeVector[leafToOpen].nodes;
							
						}
					}
					else
						break;
					
				}
			}
			
			return !isPath;
		}
		
		internal function openLeaf():void
		{
			var isPath:Boolean = true;
			var nodeVector:Vector.<TreeNode> = nodes;
			while (nodeVector[leafToOpen].hasNodes)
			{
				//trace("node to open: " + nodeVector[leafToOpen].name)
				var e:Event = new Event(MouseEvent.CLICK, false, true);
				nodeVector[leafToOpen].dispatchEvent(e);
				nodeVector[leafToOpen].removeEventListener(MouseEvent.CLICK, nodeVector[leafToOpen].nodeClick, false);
				nodeVector = nodeVector[leafToOpen].nodes;
			}
		
		}
		
		public function beginUpdate():void
		{
		
		}
		
		public function endUpdate():void
		{
			
			draw();
		}
		
		public function clear():void
		{
		
		}
		
		public function get startX():Number
		{
			return _startX;
		}
		
		public function set startX(value:Number):void
		{
			_startX = value;
		}
		
		public function get startY():Number
		{
			return _startY;
		}
		
		public function set startY(value:Number):void
		{
			_startY = value;
		}
		
		public function get horizontalIndent():Number
		{
			return _horizontalIndent;
		}
		
		public function set horizontalIndent(value:Number):void
		{
			_horizontalIndent = value;
		}
		
		public function get autoCollapseWhenNotViewed():Boolean
		{
			return _autoCollapseWhenNotViewed;
		}
		
		public function set autoCollapseWhenNotViewed(value:Boolean):void
		{
			_autoCollapseWhenNotViewed = value;
		}
		
		public function get nodes():Vector.<TreeNode>
		{
			return _nodes;
		}
		
		public function set nodes(value:Vector.<TreeNode>):void
		{
			_nodes = value;
		}
		
		public function get leafNodeAlwaysOpen():Boolean
		{
			return _leafNodeAlwaysOpen;
		}
		
		public function set leafNodeAlwaysOpen(value:Boolean):void
		{
			_leafNodeAlwaysOpen = value;
		}
		
		public function get leafToOpen():int
		{
			return _leafToOpen;
		}
		
		public function set leafToOpen(value:int):void
		{
			_leafToOpen = value;
		}
	
	}
}
