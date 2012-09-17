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
		
		private var _nodes:Vector.<TreeNode> //root Node
		
		//private var _isUpdating:Boolean;
		
		public function TreeViewComponent()
		{
			_nodes = new Vector.<TreeNode>();
			
			_startX = 50;
			_startY = 50;
			
			//_maxWidth = 300;
			//_maxHeight = 30;
			
			_horizontalIndent = 10;
			_verticalIndent = 3;
			autoCollapseWhenNotViewed = false;
			//_nodes.
			//this._isUpdating = false;
		}
		
		private function drawRootNodes():void
		{
			var y:Number = _startY;
			for (var i:int = 0; i < _nodes.length; i++, y += 30)
			{
				
				_nodes[i].initializeDepth(0);
				_nodes[i].x = startX
				_nodes[i].y = y;
				_nodes[i].draw();
				//_nodes[i].isExpanded=false;
				
				//_nodes[i].addEventListener(MouseEvent.CLICK, nodeClick, false, 0, true);
				//_nodes[i].addEventListener(MouseEvent.CLICK, nodeClick, false, 0, true);
				//_nodes[i].addEventListener(TreeEvent.NODE_SELECT, nodeClick, true, 0, true);
				_nodes[i].addEventListener(TreeEvent.NODE_ADJUST, adjustHeight, false, 0, true);
				this.addChild(_nodes[i]);
			}
		}
		
		public function clear():void
		{
			while (_nodes.length > 0)
			{
				var node:TreeNode = _nodes.pop();
				node.clear();
			}
			
			removeChild(this);
		}
		
		public function nodeClick(e:TreeEvent):void
		{
			nodeClose(e.node);
			//adjustHeight(e.node);
		/*	var path:String = "";
			var boolPath:Boolean = true;
			
			var i:int = 0;
			
			var tree:Vector.<TreeNode> = this.nodes;
			
			while (boolPath)
			{
				
				if (tree[i].containsNode(e.node))
				{
					path += tree[i].name;
					if (tree[i].equals(e.node))
					{
						boolPath = false;
						
					}
					else
					{
						tree = tree[i].nodes;
						i = -1;
					}
				}
				i++;
			}
			var event:TreeEvent = new TreeEvent(TreeEvent.BREADCRUMB, false, false);
			event.path = path;
			
			dispatchEvent(event);*/
		}
		
		public function nodeClose(node:TreeNode):void
		{
			for (var i:int = 0; i < this.nodes.length; i++)
			{
				//if(!hasPassed){
				if (!this.nodes[i].containsNode(node))
				{
					trace("adjustheight -----------------");
					trace("adjustheight @" + this.nodes[i].depth);
					if (nodes[i].isExpanded)
					{
						var f:TreeEvent = new TreeEvent(TreeEvent.NODE_ADJUST, true);
						f.node = this.nodes[i];
						f.adjustmentHeight = nodes[i].nodes.length * 30 * -1;
						
						this.nodes[i].dispatchEvent(f);
						trace("dispatch");
						
						if (nodes[i].hasNodes)
							nodes[i].nodeUncollapse(node);
					}
					
					nodes[i].removeNodes();
					
				}
				else
				{
					nodes[i].nodeUncollapse(node);
				}
				
			}
		}
		
		public function adjustHeight(e:TreeEvent):void
		{
			trace("adjustHeight sa root");
			var target:TreeNode = e.target as TreeNode;
			var curTarget:TreeNode = e.currentTarget as TreeNode;
			trace("@depth :" + e.node.depth)
			trace("target :" + target.name);
			trace("ctarget :" + curTarget.name);
			trace("end");
			
			var hasPassed:Boolean = false;
			for (var i:int = this.nodes.length - 1; i >= 0; i--)
			{
				if (!nodes[i].equals(target) && !nodes[i].containsNode(target) && !hasPassed)
				{
					if (this.nodes[i].button != null)
					{
						
						//this.nodes[i].button.y += e.adjustmentHeight;
						//var tween:Tweener = new Tweener();
					
						//tween.moveTween(this.nodes[i].button, this.nodes[i].button.y + e.adjustmentHeight, 10);
						//new Tweener().moveTween(this.nodes[i].button, this.nodes[i].button.y + e.adjustmentHeight, 10);
						this.nodes[i].button.y += e.adjustmentHeight;
						//this.nodes[i].button.y
						this.nodes[i].adjustSubNodes(e.adjustmentHeight);
					}
				}
				
				if (this.nodes[i].equals(target) || this.nodes[i].containsNode(target))
					hasPassed = true;
				
			}
		}
		
		public function beginUpdate():void
		{
		
		}
		
		public function endUpdate():void
		{
			//var e:TreeEvent = new TreeEvent(e.END_UPDATE, false, true);
			//e.isUpdating = false;
			//this._isUpdating = false;
			//dispatchEvent(e);
			//initializeDepthAndIndeces();
			drawRootNodes();
		}
		
		public function get nodes():Vector.<TreeNode>
		{
			return _nodes;
		}
		
		public function set nodes(value:Vector.<TreeNode>):void
		{
			_nodes = value;
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
	
	}

}