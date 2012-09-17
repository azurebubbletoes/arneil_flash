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
		private var _isExpanded:Boolean;
		
		public function TreeNode(ref:TreeViewComponent, id:String, name:String)
		{
			
			this._id = id;
			this._name = name;
			
			this.nodes = new Vector.<TreeNode>();
			this.treeViewComponent = new TreeViewComponent();
			this.treeViewComponent = ref;
			//this.isExpanded = false || this.nodes.length == 0;
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
		
		public function getAdjustmentHeight():Number
		{
			return isExpanded ? (this.height - this.button.height) : (-1 * this.nodes.length * this.height);
		}
		
		public function initializeDepth(depth:Number):void
		{
			
			for (var i:int = 0; i < this.nodes.length; i++)
			{
				this.nodes[i].initializeDepth(depth + 1);
				this.nodes[i].isExpanded = false || this.nodes.length == 0;
			}
			this.depth = depth;
		
		}
		
		public function draw():void
		{
			
			this.button = new Button(this.name, this.hasNodes);
		
			
			this.addEventListener(MouseEvent.CLICK, nodeClick, false, 0, true);
			this.addEventListener(TreeEvent.NODE_SELECT, this.treeViewComponent.nodeClick, false, 0, true);
			
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
				this.nodes[i].y = y;
				this.nodes[i].x = x;
				this.nodes[i].draw();
				this.nodes[i].addEventListener(TreeEvent.NODE_ADJUST, adjustHeight, false, 0, true);
				this.addChild(this.nodes[i]);
			}
		}
		
		public function removeNodes(includeSubNodes:Boolean = false):void
		{
			this.isExpanded = false || !hasNodes;
			
			//if (this.hasNodes)
			//{
			for (var i:int = 0; i < this.nodes.length; i++)
			{
				//if (includeSubNodes)
				//	this.nodes[i].removeNodes(includeSubNodes);
				if (contains(this.nodes[i]))
				{
					//this.nodes[i].removeEventListener(MouseEvent.CLICK, nodeClick, false);
					
					//var tween:Tweener = new Tweener();
					//this.nodes[i].button.y += 30;
					//tween.moveTween(this.nodes[i].button, this.nodes[i].button.y-30, 10);
					
					this.nodes[i].removeChild(this.nodes[i].button);
					this.nodes[i].button = null;
					this.removeChild(this.nodes[i]);
				}
				
			}
			//}/*else{
		
			//this.removeEventListener(MouseEvent.CLICK,nodeClick,false);
		/*	this.removeChild(this.button);
		   this.button=null;
		
		 }*/
		}
		
		public function nodeClick(event:Event):void
		{
			//trace("nodeclick");
			event.stopPropagation();
			//trace("click sa node @ depth"+this.depth);
			
			//trace("before "+this.isExpanded)
			if (this.hasNodes)
			{
				//this.treeViewComponent.nodeClose(this);
				if (this.isExpanded)
				{
					
					this.removeNodes(false);
				}
				else
				{
					
					this.createNodes();
				}
				
			}
			
			//	trace(getAdjustmentHeight());
			
			var e:TreeEvent = new TreeEvent(TreeEvent.NODE_SELECT, false);
			e.node = this;
			e.adjustmentHeight = this.getAdjustmentHeight();
			dispatchEvent(e);
			trace("-----------------------------------------------")
			trace("height!: " + getAdjustmentHeight());
			var f:TreeEvent = new TreeEvent(TreeEvent.NODE_ADJUST, true);
			f.node = this;
			f.adjustmentHeight = this.getAdjustmentHeight();
			dispatchEvent(f);
		}
		
		public function adjustHeight(e:TreeEvent):void
		{
			
			//this.parent.dispatchEvent(e);
			//	e.stopPropagation();
			trace("adjustheight sa tree node")
			//trace(e.currentTarget.name)
			
			var target:TreeNode = e.target as TreeNode;
			var curTarget:TreeNode = e.currentTarget as TreeNode;
			trace("@depth :" + e.node.depth)
			trace("target :" + target.name);
			trace("ctarget :" + curTarget.name); //variable change
			trace("end");
			
			var hasPassed:Boolean = false;
			for (var i:int = this.nodes.length - 1; i >= 0; i--)
			{
				//if(this.nodes[i].containsNode())
				
				if (!nodes[i].equals(target) && !nodes[i].containsNode(target) && !hasPassed)
				{
					if (this.nodes[i].button != null)
					{
						
						//this.nodes[i].button.y += e.adjustmentHeight;
						
						//new Tweener().moveTween(this.nodes[i].button, this.nodes[i].button.y + e.adjustmentHeight, 10);
						this.nodes[i].button.y += e.adjustmentHeight;
						//this.nodes[i].button.y += e.adjustmentHeight;
						this.nodes[i].adjustSubNodes(e.adjustmentHeight);
					}
				}
				
				if (this.nodes[i].equals(target) || this.nodes[i].containsNode(target))
					hasPassed = true;
				
			}
		
		}
		
		public function adjustSubNodes(height:Number):void
		{
			
			//if (this.isExpanded){
			
			for (var i:int = 0; i < this.nodes.length; i++)
			{
				if (this.nodes[i].button) {
					//new Tweener().moveTween(this.nodes[i].button, this.nodes[i].button.y+height, 10);
					this.nodes[i].button.y += height;
				}
				if (this.isExpanded)
					this.nodes[i].adjustSubNodes(height);
			}
			//}
		
		}
		
		public function nodeUncollapse(node:TreeNode):void
		{
			trace("@depth" + this.depth);
			for (var i:int = 0; i < this.nodes.length; i++)
			{
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
						
						if (nodes[i].hasNodes)
							nodes[i].nodeUncollapse(node);
					}
					
					this.nodes[i].removeNodes();
					
				}
				else
				{
					if (!nodes[i].equals(node))
						nodes[i].nodeUncollapse(node);
					
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
	
	
	
	}

}