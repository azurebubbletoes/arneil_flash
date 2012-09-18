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
		private var _verticalIndent:Number;
		
		private var _useTween:Boolean;
		private var _autoCollapseWhenNotViewed:Boolean;
		
		private var _nodes:Vector.<TreeNode>;
		private var _nodeContainerSprite:Sprite;
		
		//private var _isUpdating:Boolean;
		
		public function TreeViewComponent()
		{
			_startX = 50;
			_startY = 50;
			
			_nodeContainerSprite = new Sprite();
			addChild(_nodeContainerSprite);
			_nodes = new Vector.<TreeNode>();
			
			_horizontalIndent = 10;
			_verticalIndent = 3;
			_autoCollapseWhenNotViewed = false;
		
		}
		
		private function drawRootNodes():void
		{
			var y:Number = _startY;
			for (var i:int = 0; i < _nodes.length; i++, y += 30)
			{
				this.nodes[i].initializeDepth(0);
				this.nodes[i].x = _startX;
				this.nodes[i].y = y;
				this.nodes[i].draw();
				_nodeContainerSprite.addChild(this.nodes[i]);
			}
		
		}
		
		internal function closeNodes(node:TreeNode):void
		{
			
			for (var i:int = 0; i < this.nodes.length; i++)
			{
				if (this.nodes[i].isExpanded)
				{
					if (!this.nodes[i].containsNode(node))
					{
						
						this.nodes[i].button.toggleLabel(this.nodes[i].nodes.length == 0 ? false : true);
						
						this.nodes[i].removeNodes();
						adjustHeight(this.nodes[i]);
					}
					else
					{
						if (!this.nodes[i].equals(node))
							this.nodes[i].closeNodes(node);
					}
					
				}
				
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
