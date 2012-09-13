package components.treeview
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author arneil mercado
	 */
	public class TreeNode extends Sprite
	{
		private var _nodes:Vector.<TreeNode>;
		private var _depth:int;
		private var _id:String;
		private var _name:String;
		private var _button:Button;
		private var _treeViewComponent:TreeViewComponent;
		private var _nodeIndex:int;
		private var _startY:Number;
		private var _isExpanded:Boolean;
		
		public function TreeNode(ref:TreeViewComponent, id:String, name:String)
		{
			
			this._id = id;
			this._name = name;
			this.isExpanded = false;
			
			this.nodes = new Vector.<TreeNode>();
			
			this.treeViewComponent = new TreeViewComponent();
			this.treeViewComponent = ref;
		
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
		
		public override function get name():String
		{
			return _name;
		}
		
		public override function set name(value:String):void
		{
			_name = value;
		}
		
		public function get id():String
		{
			return _id;
		}
		
		public function set id(value:String):void
		{
			_id = value;
		}
		
		public function get treeViewComponent():TreeViewComponent
		{
			return _treeViewComponent;
		}
		
		public function set treeViewComponent(value:TreeViewComponent):void
		{
			_treeViewComponent = value;
		}
		
		public function get nodes():Vector.<TreeNode>
		{
			return _nodes;
		}
		
		public function set nodes(value:Vector.<TreeNode>):void
		{
			_nodes = value;
		}
		
		public function get depth():int
		{
			return _depth;
		}
		
		public function set depth(value:int):void
		{
			_depth = value;
		}
		
		public function get nodeIndex():int
		{
			return _nodeIndex;
		}
		
		public function set nodeIndex(value:int):void
		{
			_nodeIndex = value;
		}
		
		public function get isExpanded():Boolean
		{
			return _isExpanded;
		}
		
		public function set isExpanded(value:Boolean):void
		{
			_isExpanded = value;
		}
		
		public function get startY():Number
		{
			return _startY;
		}
		
		public function set startY(value:Number):void
		{
			_startY = value;
		}
		
		public function get button():Button
		{
			return _button;
		}
		
		public function set button(value:Button):void
		{
			_button = value;
		}
		
		public function initializeDepth(depth:Number):void
		{
			
			for (var i:int = 0; i < this.nodes.length; i++)
			{
				trace("depth!");
				trace(this.depth);
				this.nodes[i].initializeDepth(depth + 1);
				
			}
			this.depth = depth;
		
		}
		
		public function draw():void
		{
			//var startY:Number = tree.startY;
			this.isExpanded = false || this.nodes.length == 0;
			var tree:TreeViewComponent = this.treeViewComponent;
			
			var x:Number = tree.startX + (this.depth * tree.horizontalIndent);
			var y:Number = this.startY; // (this.nodeIndex * tree.maxHeight);
			var width:Number = tree.maxWidth + tree.startX - x;
			var height:Number = tree.maxHeight;
			//this.isExpanded = false;
			
			var collapseIcon:String = this.nodes.length > 0 ? "+" : "-";
			
			_button = new Button(this.name, x, y, width, height, collapseIcon);
			this.addEventListener(MouseEvent.CLICK, nodeClick, false, 0, true);
			
			this.addChild(_button);
			
			if (tree.autoCollapseWhenNotViewed)
				drawNodes();
		
			//this.initializeIndices();
		
		}
		
		public function numberOfExpandedNodes():int
		{
			
			var branches:int = this.nodes.length;
			
			if (this.nodes.length > 0)
			{
				for (var i:int = 0; i < this.nodes.length; i++)
				{
					if (this.nodes[i].isExpanded)
						branches += this.nodes[i].numberOfExpandedNodes();
				}
			}
			return branches;
		
		}
		
		public function nodeClick(e:Event):void
		{
			var hasNodes:Boolean = this.nodes.length > 0;
			var subNodes:int = this.numberOfExpandedNodes();
			var expand:Boolean = this.isExpanded;
			
			if (hasNodes)
			{
				this.treeViewComponent.nodeClose(this);
				if (this.isExpanded)
				{
					this.removeNodes();
				}
				else
				{
					
					this.drawNodes();
					subNodes = this.numberOfExpandedNodes();
				}
				
			}
		
		}
		
		public function equals(t:TreeNode):Boolean
		
		{
			return this.id == t.id && this.name == name && this.nodes == t.nodes && this.treeViewComponent == t.treeViewComponent;
		}
		
		public function initializeIndeces():void
		{
			if (this.nodes.length > 0)
			{
				for (var i:int = 0; i < this.nodes.length; i++)
				{
					this.nodes[i].nodeIndex = i; // initializes the depth of the node and it's branches..
					this.nodes[i].initializeIndeces();
				}
			}
		
		}
		
		public function drawNodes():void
		{
			this.isExpanded = true;
			var y:Number = this.startY + _button.height;
			for (var i:int = 0; i < this.nodes.length; i++, y += _button.height)
			{
				this.nodes[i].startY = y;
				this.nodes[i].draw();
				
				this.addChild(this.nodes[i]);
				this.nodes[i].addEventListener(MouseEvent.CLICK, nodeClick, false, 0, true);
				this.nodes[i].addEventListener(TreeEvent.NODE_ADJUST, nodeAdjust, false, 0, true);
			}
		}
		
		public function removeNodes(includeSubNodes:Boolean = false):void
		{
			this.isExpanded = false;
			
			if (this.nodes.length > 0)
			{
				for (var i:int = 0; i < this.nodes.length; i++)
				{
					if (includeSubNodes)
						this.nodes[i].removeNodes(includeSubNodes);
					if (contains(this.nodes[i]))
					{
						this.nodes[i].removeEventListener(MouseEvent.CLICK, nodeClick, false);
						this.nodes[i].removeEventListener(TreeEvent.NODE_ADJUST, nodeAdjust, false);
						this.removeChild(this.nodes[i]);
						this.nodes[i].removeChild(this.nodes[i].button);
						this.nodes[i].button = null;
					}
				}
			}
		}
		
		public function containsNode(t:TreeNode):Boolean
		{
			var flag:Boolean = this.equals(t);
			
			trace("@" + this.name);
			if (!flag)
			{
				for (var i:int = 0; i < this.nodes.length; i++)
				{
					flag = flag || this.nodes[i].containsNode(t);
					
					if (flag)
					{
						trace("flag break");
						break;
					}
				}
			}
			return flag;
		}
		
		public function nodeAdjust(e:TreeEvent):void
		{
			trace("@depth" + this.depth);
			dispatchEvent(e);
		}
	
	}

}