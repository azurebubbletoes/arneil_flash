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
			addChild(this.nodes);
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
		
		
		
		public function draw():void
		{
			
			this.button = new Button(this.name, this.hasNodes);
			this.nodes.y = this.button.y + this.button.height;
			var x:Number = this.button.x + ((this.depth+1) * treeViewComponent.horizontalIndent);
			this.nodes.x = x;
			this.addEventListener(MouseEvent.CLICK, nodeClick, false, 0, true);
			//this.addEventListener(TreeEvent.NODE_SELECT, this.treeViewComponent.nodeClick, false, 0, true);
			
			this.addChild(this.button);
			
			//if (this.treeViewComponent.autoCollapseWhenNotViewed)
			//	this.createNodes();
			
			
			this.nodes.createNodes();
			if (!this.treeViewComponent.autoCollapseWhenNotViewed)//{
				removeNodes();
				
			//}else
			//	this.treeViewComponent.adjustHeight(this);
		}
		
		public function createNodes():void
		{
			this.isExpanded=true;
			addChild(this.nodes);
		}
		
		public function removeNodes():void
		{
			this.isExpanded=false;
			//if(this.nodes.isCreated)
				removeChild(this.nodes);
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
					this.nodes.y += 30;
					new Tweener().moveTween(this.nodes, this.nodes.y - 30, 5);
					this.createNodes();
				}
			}
			
			
			this.treeViewComponent.closeNodes(this);
			this.treeViewComponent.adjustHeight(this);//close the open nodes;
			/*/this.treeViewComponent.adjustHeight(this); //close the open nodes;
			//trace("----------------------------------");
			/*var e:TreeEvent = new TreeEvent(TreeEvent.NODE_ADJUST, true);
			e.node = this;
			e.boundHeight = this.getBoundHeight();
			dispatchEvent(e);*/
			//trace(getBoundHeight());
			//trace(this.nodes.height);
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
		
		
		
		
	
		
	}

}