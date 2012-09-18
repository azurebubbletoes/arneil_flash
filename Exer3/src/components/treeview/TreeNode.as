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
		private var _nodeContainerSprite:Sprite;
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
			
			this.nodes = new Vector.<TreeNode>();
			this.treeViewComponent = new TreeViewComponent();
			this.treeViewComponent = ref;
			
			this.nodeContainerSprite = new Sprite();
			addChild(this._nodeContainerSprite);
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
		
		public function get nodes():Vector.<TreeNode>
		{
			return _nodes;
		}
		
		public function set nodes(value:Vector.<TreeNode>):void
		{
			_nodes = value;
		}
		
		public function get nodeContainerSprite():Sprite
		{
			return _nodeContainerSprite;
		}
		
		public function set nodeContainerSprite(value:Sprite):void
		{
			_nodeContainerSprite = value;
		}
		
		public function getBoundHeight():Number
		{
			return isExpanded ? (this.height - this.button.height) : (-1 * this.nodes.length * this.height);
		}
		
		public function draw():void
		{
			trace("draw");
			this.button = new Button(this.name, this.hasNodes);
			
			var x:Number = this.button.x + ((this.depth + 1) * treeViewComponent.horizontalIndent);
			nodeContainerSprite.y = this.button.y + this.button.height;
			nodeContainerSprite.x = x;
			this.addEventListener(MouseEvent.CLICK, nodeClick, false, 0, true);
			
			this.addChild(this.button);
			
			this.createSubNodes();
			if (!this.treeViewComponent.autoCollapseWhenNotViewed) //{
				this.removeNodes();
		
		}
		
		public function createNodes():void
		{
			this.isExpanded = true;
			addChild(nodeContainerSprite);
		}
		
		public function removeNodes():void
		{
			this.isExpanded = false;
			//if(this.nodes.isCreated)
			removeChild(nodeContainerSprite);
			//else
		
		}
		
		public function nodeClick(event:Event):void
		{
			
			event.stopPropagation();
			
			if (this.hasNodes)
			{
				
				if (this.isExpanded)
				{
					
					this.button.toggleLabel(true);
					
					this.removeNodes();
					
				}
				else
				{
					this.button.toggleLabel(false);
					this.nodeContainerSprite.y += 30;
					new Tweener().moveTween(nodeContainerSprite, this.nodeContainerSprite.y - 30, 5);
					this.createNodes();
				}
			}
			
			this.treeViewComponent.closeNodes(this);
			this.treeViewComponent.adjustHeight(this);
		
		}
		
		public function createSubNodes():void
		{
			var y:Number = 0;
			var x:Number = 0;
			
			for (var i:int = 0; i < this.nodes.length; i++, y += 30)
			{
				this.nodes[i].y = y;
				this.nodes[i].x = x;
				this.nodes[i].draw();
				
				nodeContainerSprite.addChild(this.nodes[i]);
			}
		}
		
		public function closeNodes(node:TreeNode):void
		{
			trace("close");
			for (var i:int = 0; i < this.nodes.length; i++)
			{
				if (this.nodes[i].isExpanded)
				{
					if (!this.nodes[i].containsNode(node))
					{
						
						this.nodes[i].button.toggleLabel(this.nodes[i].nodes.length == 0 ? false : true);
						
						this.nodes[i].removeNodes();
						this.treeViewComponent.adjustHeight(this.nodes[i]);
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
			
			var hasPassed:Boolean = false
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
					flag = flag || this.nodes[i].containsNode(t);
					
					if (flag)
					{
						break;
					}
				}
			}
			return flag;
		}
		
		public function initializeDepth(depth:Number):void
		{
			this.depth = depth;
			for (var i:int = 0; i < this.nodes.length; i++)
			{
				this.nodes[i].depth = depth;
				this.nodes[i].isExpanded = !(false || this.nodes[i].nodes.length == 0);
				if (this.nodes[i].hasNodes)
					this.nodes[i].initializeDepth(depth + 1);
			}
		}
	
	}

}