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
		
		//	private var _maxWidth:Number;
		//	private var _maxHeight:Number;
		
		private var _horizontalIndent:Number;
		private var _verticalIndent:Number;
		
		private var _useTween:Boolean;
		private var _autoCollapseWhenNotViewed:Boolean;
		
		private var _nodes:TreeNodeList //root Node
		
		//private var _isUpdating:Boolean;
		
		public function TreeViewComponent()
		{
			_nodes = new TreeNodeList();
			
			_startX = 50;
			_startY = 50;
			
			//_maxWidth = 300;
			//_maxHeight = 30;
			
			_horizontalIndent = 10;
			_verticalIndent = 3;
			_autoCollapseWhenNotViewed = false;
			//_nodes.
			//this._isUpdating = false;
		}
		
		private function drawRootNodes():void
		{
			
			var y:Number = _startY;
			for (var i:int = 0; i < nodes.nodes.length; i++, y += 30)
			{
				
				nodes.nodes[i].initializeDepth(0);
				nodes.nodes[i].x = startX
				nodes.nodes[i].y = y;
				nodes.nodes[i].draw();
				nodes.nodes[i].addEventListener(TreeEvent.NODE_ADJUST, adjustHeight, false, 0, true);
				this.nodes.addChild(nodes.nodes[i]);
			}
			addChild(this.nodes);
		}
		
		internal function nodeClose(treenode:TreeNode):void
		{
			//trace("close!");
			for (var i:int = 0; i < this.nodes.length; i++)
			{
				var node:TreeNode = this.nodes.nodes[i];
				
				if (!node.containsNode(treenode))
				{

						
					
					//create adjust treeEvent
					
					if (node.isExpanded)
					{	
						node.removeNodes();
						var e:TreeEvent = new TreeEvent(TreeEvent.NODE_ADJUST, true);
						e.node = node;
						e.boundHeight =node.getBoundHeight();
						node.dispatchEvent(e);
						
						
						/**/
					}
				}
				else
				{
					//if (!node.equals(treenode))
					node.nodeClose(treenode);
					
				}
				
			}
		}
		
		internal function adjustHeight(e:TreeEvent):void
		{
			
			//trace("adjust height sa root");
			var target:TreeNode = e.target as TreeNode;
			var stop:Boolean = false;
			//trace(target.name);
			trace(e.boundHeight);
			
			for (var i:int = this.nodes.length - 1; i >= 0; i--)
			{
				if (this.nodes.nodes[i].equals(target) || (!this.nodes.nodes[i].equals(target) && this.nodes.nodes[i].containsNode(target)))
				{
					stop = true;
				}
				
				if (!stop)
				{
					//adjust
					this.nodes.nodes[i].adjustAllSubNodes(e.boundHeight);
				}
			}
		
		}
		
		public function beginUpdate():void
		{
		
		}
		
		public function endUpdate():void
		{
			
			drawRootNodes();
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
		
		public function get verticalIndent():Number
		{
			return _verticalIndent;
		}
		
		public function set verticalIndent(value:Number):void
		{
			_verticalIndent = value;
		}
		
		public function get autoCollapseWhenNotViewed():Boolean
		{
			return _autoCollapseWhenNotViewed;
		}
		
		public function set autoCollapseWhenNotViewed(value:Boolean):void
		{
			_autoCollapseWhenNotViewed = value;
		}
		
		public function get nodes():TreeNodeList
		{
			return _nodes;
		}
		
		public function set nodes(value:TreeNodeList):void
		{
			_nodes = value;
		}
	
	}
}
