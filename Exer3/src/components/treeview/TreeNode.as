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
		private var _nodes:TreeNodeList;
		private var _depth:int;
		private var _id:String;
		private var _name:String;
		private var _button:Button;
		private var _treeViewComponent:TreeViewComponent;
		private var _nodeIndex:int;
		private var _isExpanded:Boolean;
		
		public function TreeNode(ref:TreeViewComponent, id:String, name:String)
		{
			
			this._id = id;
			this._name = name;
			
			this.nodes = new TreeNodeList();
			this.treeViewComponent = new TreeViewComponent();
			this.treeViewComponent = ref;
		}
		
		public function clear():void
		{
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
		
		public function get button():Button
		{
			return _button;
		}
		
		public function get hasNodes():Boolean
		{
			return this.nodes.length > 0;
		}
		
		public function set button(value:Button):void
		{
			_button = value;
		}
		
		public function get nodes():TreeNodeList
		{
			return _nodes;
		}
		
		public function set nodes(value:TreeNodeList):void
		{
			_nodes = value;
		}
		
		public function getBoundHeight():Number
		{
			return isExpanded ? (this.height - this.button.height) : (-1 * this.nodes.length * this.height);
		}
		
		public function initializeDepth(depth:Number):void
		{
			
			for (var i:int = 0; i < this.nodes.length; i++)
			{
				this.nodes.nodes[i].initializeDepth(depth + 1);
				this.nodes.nodes[i].isExpanded = false || this.nodes.length == 0;
			}
			this.depth = depth;
		
		}
		
		public function draw():void
		{
			
			this.button = new Button(this.name, this.hasNodes);
			
			this.addEventListener(MouseEvent.CLICK, nodeClick, false, 0, true);
			//this.addEventListener(TreeEvent.NODE_SELECT, this.treeViewComponent.nodeClick, false, 0, true);
			
			this.addChild(this.button);
			
			if (this.treeViewComponent.autoCollapseWhenNotViewed)
				this.createNodes();
		
		}
		
		public function createNodes():void
		{
			
			this.isExpanded = true;
			
			var y:Number = this.button.y + this.button.height;
			var x:Number = this.button.x + ((this.depth + 1) * treeViewComponent.horizontalIndent);
			
			for (var i:int = 0; i < this.nodes.length; i++, y += 30)
			{
				this.nodes.nodes[i].y = y;
				this.nodes.nodes[i].x = x;
				this.nodes.nodes[i].draw();
				this.nodes.nodes[i].addEventListener(TreeEvent.NODE_ADJUST, adjustHeight, false, 0, true);
				this.nodes.addChild(this.nodes.nodes[i]);
			}
			addChild(this.nodes);
		}
		
		public function removeNodes():void
		{
			trace("remove");
			this.isExpanded = false || !hasNodes;
			
			for (var i:int = 0; i < this.nodes.length; i++)
			{
				
				if (contains(this.nodes.nodes[i]))
				{
					
					this.nodes.nodes[i].removeChild(this.nodes.nodes[i].button);
					this.nodes.nodes[i].button = null;
					this.nodes.removeChild(this.nodes.nodes[i]);
				}
				
			}
			
			removeChild(this.nodes);
		
		}
		
		public function nodeClick(event:Event):void
		{
			
			event.stopPropagation();
			
			if (this.hasNodes)
			{
				if (this.isExpanded)
				{
					
					this.removeNodes();
				}
				else
				{
					
					this.createNodes();
				}
			}
			
			this.treeViewComponent.nodeClose(this); //close the open nodes;
			//trace("----------------------------------");
			var e:TreeEvent = new TreeEvent(TreeEvent.NODE_ADJUST, true);
			e.node = this;
			e.boundHeight = this.getBoundHeight();
			dispatchEvent(e);
			//trace(getBoundHeight());
			//trace(this.nodes.height);
		}
		
		public function nodeClose(treenode:TreeNode):void
		{
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
						e.boundHeight = node.getBoundHeight();
						node.dispatchEvent(e);
						
						
						
					/*	*/
					}
				}
				else
				{
					if (!node.equals(treenode))
						node.nodeClose(treenode);
					
				}
				
			}
		
		}
		
		public function equals(t:TreeNode):Boolean
		{
			return this.id == t.id && this.name == t.name && this.nodes == t.nodes && this.treeViewComponent == t.treeViewComponent;
		}
		
		public function containsNode(t:TreeNode):Boolean
		{
			var flag:Boolean = this.equals(t);
			
			if (!flag && this.hasNodes)
			{
				for (var i:int = 0; i < this.nodes.length; i++)
				{
					flag = flag || this.nodes.nodes[i].containsNode(t);
					
					if (flag)
					{
						break;
					}
				}
			}
			return flag;
		}
		
		public function adjustHeight(event:TreeEvent):void //includes the subnodes
		{
			//event.stopPropagation();
			var target:TreeNode = event.target as TreeNode;
			var stop:Boolean = false;
			//trace("adjustheight sa node");
			//trace(target.name);
			trace(event.boundHeight)
			
			for (var i:int = this.nodes.length - 1; i >= 0; i--)
			{
				if (this.nodes.nodes[i].equals(target) || (!this.nodes.nodes[i].equals(target) && this.nodes.nodes[i].containsNode(target)))
				{
					stop = true;
				}
				
				if (!stop)
				{
					//adjust
					this.nodes.nodes[i].adjustAllSubNodes(event.boundHeight);
				}
			}
		
		}
		
		public function adjustAllSubNodes(height:Number):void
		{
			if (this.button)
				this.button.y += height;
			
			for (var i:int = 0; i < this.nodes.length; i++)
			{
				
				if (this.nodes.nodes[i].isExpanded)
					this.nodes.nodes[i].adjustAllSubNodes(height);
			}
		
		}
	
	}

}