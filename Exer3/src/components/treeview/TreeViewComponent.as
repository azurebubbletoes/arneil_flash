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
		
		private var _tweenSpeed:Number;
		private var _autoCollapseWhenNotViewed:Boolean;
		
		private var _nodes:Vector.<TreeNode>;
		private var _nodeContainerSprite:Sprite;
		
		private var _leafNodeAlwaysOpen:Boolean;
		private var _emptyNodesAlwaysBottom:Boolean;
		
		private var _leafToOpen:int;
		private var _isLeafOpened:Boolean;
		
		public function TreeViewComponent()
		{
			
			initialize();
		}
		
		private function initialize():void
		{
			//------------------
			_autoCollapseWhenNotViewed = false;
			_leafNodeAlwaysOpen = false;
			_leafToOpen = 0; //default opened leaf if  leafNodeAlwasOpen
			_isLeafOpened = false;
		
			_startX = 50;
			_startY = 50;
			_horizontalIndent = 10;
			
			_tweenSpeed = .4;
			
			_nodeContainerSprite = new Sprite();
			_nodes = new Vector.<TreeNode>();
			
			_emptyNodesAlwaysBottom = !false;
			
			addChild(_nodeContainerSprite);
		
		}
		
		public function draw():void
		{
			if (this.emptyNodesAlwaysBottom)
				EmptyNodesAtBottom(this.nodes);
			
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
			isLeafOpened = true;
			//trace(numberOfOpenLeaves(this.nodes));
			//trace(onlyOpenedLeaf(this.nodes));
		
		}
		
		internal function closeNodes(node:TreeNode, nodelist:Vector.<TreeNode>):void
		{
			
			var i:int = 0;
			var nodes:Vector.<TreeNode> = nodelist;
			
			while (i < nodes.length)
			{
				var currentNode:TreeNode = nodes[i];
				
				if (currentNode.isExpanded)
				{
					
					if (!currentNode.containsNode(node))
					{
						if (node.hasNodes)
						{
							
							if (autoCollapseWhenNotViewed)
							{
								currentNode.button.toggleLabel(currentNode.nodes.length == 0 ? false : true);
								currentNode.removeNodes();
								adjustHeight(currentNode, this.nodes);
								
							}
							
						}
					}
					else
					{
						
						if (!currentNode.equals(node))
							closeNodes(node, currentNode.nodes);
					}
				}
				
				i++;
			}
		
		}
		
		internal function adjustHeight(node:TreeNode, nodelist:Vector.<TreeNode>):void
		{
			var i:int = 0;
			var nodes:Vector.<TreeNode> = nodelist;
			var height:Number = node.isExpanded ? node.nodeContainerSprite.height : node.nodeContainerSprite.height * -1;
			var hasPassed:Boolean = false;
			
			while (i < nodes.length)
			{
				var currentNode:TreeNode = nodes[i];
				
				if (hasPassed && !currentNode.containsNode(node) && !currentNode.equals(node))
				{
					
					currentNode.y += height;
					
				}
				if (currentNode.containsNode(node))
				{
					hasPassed = true;
					
					if (!currentNode.equals(node))
						adjustHeight(node, currentNode.nodes);
				}
				
				i++;
			}
		
		}
		
		internal function EmptyNodesAtBottom(nodes:Vector.<TreeNode>):void
		{
			
			var i:int = 0;
			var nodes:Vector.<TreeNode> = nodes;
			var emptyNodeCounter:int = 1;
			while (i < nodes.length)
			{
				
				var node:TreeNode = nodes[i];
				//trace(nodes[i].name);
				
				if (node.hasNodes)
				{
					EmptyNodesAtBottom(node.nodes);
				}
				else
				{
					
					if ((emptyNodeCounter + i) <= nodes.length)
					{
						nodes.splice(i, 1);
						nodes.push(node);
						i--;
						emptyNodeCounter++;
					}
				}
				i++;
			}
		
		}
		
		internal function numberOfOpenLeaves(nodelist:Vector.<TreeNode>):int
		{
			var ctr:int = 0;
			var i:int = 0;
			var nodes:Vector.<TreeNode> = nodelist;
			
			while (i < nodes.length)
			{
				
				var currentNode:TreeNode = nodes[i];
				//trace("=============================================");
				//trace("cur leaf: " + currentNode.name);
				//trace("isExpanded: " + currentNode.isExpanded);
				//trace("");
				
				if (currentNode.isExpanded)
				{
					//if (currentNode.hasNodes)
					ctr += numberOfOpenLeaves(currentNode.nodes);
					
				}
				else
				{
					if (!currentNode.hasNodes && currentNode.depth != 0)
					{
						
						ctr += 1;
						
					}
				}
				//trace("");
				
				i++;
			}
			return ctr;
		}
		
		internal function containsAllOpenedLeaves(node:TreeNode, nodelist:Vector.<TreeNode>):Boolean
		{
			
			var i:int = 0;
			var nodes:Vector.<TreeNode> = nodelist;
			var openedLeaves:Vector.<TreeNode> = new Vector.<TreeNode>();
			var contain:Boolean = true;
			
			while (i < nodes.length)
			{
				var currentNode:TreeNode = nodes[i];
				
				if (currentNode.isExpanded)
				{
					contain = contain && containsAllOpenedLeaves(node,currentNode.nodes);
				}
				else
				{
					if (!currentNode.hasNodes && currentNode.depth != 0)
					{
						
						contain = contain && (node.contains(currentNode) ? true : false);
						
					}
				}
				
				i++;
			}
			return contain;
		
		}
		
		internal function onlyOpenedLeaf(nodelist:Vector.<TreeNode>):TreeNode
		{
			
			var i:int = 0;
			var nodes:Vector.<TreeNode> = nodelist;
			//var openedLeaves:Vector.<TreeNode> = new Vector.<TreeNode>();
			var node:TreeNode;
			while (i < nodes.length)
			{
				
				var currentNode:TreeNode = nodes[i];
				
				if (currentNode.hasNodes)
				{
					if (currentNode.isExpanded)
						node = onlyOpenedLeaf(currentNode.nodes);
					
				}
				else
				{
					
					if (currentNode.depth != 0)
					{
						//trace("wawa")
						//trace(currentNode.name)
						node = currentNode;
						
						break;
					}
				}
				i++;
			}
			return node;
		
		}
		
		internal function openLeaf():void
		{
			var isPath:Boolean = true;
			var nodeVector:Vector.<TreeNode> = nodes;
			while (nodeVector[leafToOpen].hasNodes)
			{
				var e:Event = new Event(MouseEvent.CLICK, false, true);
				nodeVector[leafToOpen].dispatchEvent(e);
				nodeVector = nodeVector[leafToOpen].nodes;
			}
		
		}
		
		//internal function
		
		
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
		
		public function get emptyNodesAlwaysBottom():Boolean
		{
			return _emptyNodesAlwaysBottom;
		}
		
		public function set emptyNodesAlwaysBottom(value:Boolean):void
		{
			_emptyNodesAlwaysBottom = value;
		}
		
		public function get tweenSpeed():Number
		{
			return _tweenSpeed;
		}
		
		public function set tweenSpeed(value:Number):void
		{
			_tweenSpeed = value;
		}
		
		public function get isLeafOpened():Boolean
		{
			return _isLeafOpened;
		}
		
		public function set isLeafOpened(value:Boolean):void
		{
			_isLeafOpened = value;
		}
	
	}
}
