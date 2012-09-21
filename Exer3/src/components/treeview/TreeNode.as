package components.treeview
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	import com.gskinner.motion.GTween;
	
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
		
		private var _isExpanded:Boolean;
		
		public function TreeNode(ref:TreeViewComponent, id:String, name:String)
		{
			this._id = id;
			this._name = name;
			this.treeViewComponent = ref;
			
			initialize();
		}
		
		private function initialize():void
		{
			this.nodes = new Vector.<TreeNode>();
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
		
		public function draw():void
		{
			var x:Number = this.button.x + ((this.depth + 1) * treeViewComponent.horizontalIndent);
			nodeContainerSprite.y = this.button.y + this.button.height;
			nodeContainerSprite.x = x;
		}
		
		public function drawButton():void
		{
			this.button = new Button(this.name, this.hasNodes);
			this.addEventListener(MouseEvent.CLICK, nodeClick, false, 0, true);
			
			this.addChild(this.button);
			draw();
			
			this.createSubNodes();
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
			removeChild(nodeContainerSprite);
		
		}
		
		public function nodeClick(event:Event):void
		{
			
			event.stopPropagation();
			var tree:TreeViewComponent = this.treeViewComponent;
			var isOpened:Boolean = tree.isLeafOpened;
			var leafNodesOpen:Boolean = tree.leafNodeAlwaysOpen;
			
			var containsMultipleLeaves:Boolean = tree.containsAllOpenedLeaves(this, tree.nodes) && tree.numberOfOpenLeaves(tree.nodes) > 1;
			var isNullOpenLeaf:Boolean = tree.onlyOpenedLeaf(this.nodes) ? false : true;
			var containsOneLeaf:Boolean = (!isNullOpenLeaf ? this.containsNode(tree.onlyOpenedLeaf(this.nodes)) : false) && tree.numberOfOpenLeaves(tree.nodes) == 1
			
			var closeLeaf:Boolean = !((containsMultipleLeaves || containsOneLeaf) && leafNodesOpen && isOpened); //  ((!containsMultipleLeaves || !containsOneLeaf) && !leafNodesOpen && !isOpened);
			
			if (this.hasNodes)
			{
				if (this.isExpanded)
				{
					
					if (closeLeaf)
					{
						this.button.toggleLabel(true);
						this.removeNodes();
					}
					
				}
				else
				{
					
					this.button.toggleLabel(false);
					this.nodeContainerSprite.y;
					var myTween:GTween = new GTween(this.nodeContainerSprite, this.treeViewComponent.tweenSpeed, {y: 0}, {swapValues: true});
					this.createNodes();
					
					if (leafNodesOpen && isOpened && tree.numberOfOpenLeaves(this.nodes) == 0 && tree.autoCollapseWhenNotViewed)
					{
						openNode();
						
					}
				}
				
				
				
				containsMultipleLeaves = tree.containsAllOpenedLeaves(this, tree.nodes) && tree.numberOfOpenLeaves(tree.nodes) > 1;
				isNullOpenLeaf = tree.onlyOpenedLeaf(this.nodes) ? false : true;
				containsOneLeaf = (!isNullOpenLeaf ? this.containsNode(tree.onlyOpenedLeaf(this.nodes)) : false) && tree.numberOfOpenLeaves(tree.nodes) == 1
				
				
				closeLeaf = !((containsMultipleLeaves || containsOneLeaf) && leafNodesOpen && isOpened);
				
				if (closeLeaf || !this.isExpanded)
				{
					trace("close")
					treeViewComponent.closeNodes(this, this.treeViewComponent.nodes);
					this.treeViewComponent.adjustHeight(this, this.treeViewComponent.nodes);
				}
				
			}
		
		}
		
		public function openNode():void
		{
			var index:int = 0;
			var nodes:Vector.<TreeNode> = this.nodes;
			while (nodes[index].hasNodes)
			{
				var e:Event = new Event(MouseEvent.CLICK, false, true);
				nodes[index].dispatchEvent(e);
				nodes = nodes[index].nodes;
			}
		}
		
		public function createSubNodes():void
		{
			var y:Number = 0;
			var x:Number = 0;
			
			for (var i:int = 0; i < this.nodes.length; i++, y += 30)
			{
				//trace(this.nodes[i].name)
				this.nodes[i].y = y;
				this.nodes[i].x = x;
				
				this.nodes[i].drawButton();
				
				nodeContainerSprite.addChild(this.nodes[i]);
				
			}
		}
		
		public function equals(t:TreeNode):Boolean
		{
			//return this.id == t.id && this.name == t.name && this.nodes == t.nodes && this.treeViewComponent == t.treeViewComponent;
			return t ? (this.id == t.id && this.name == t.name) : false; // && this.nodes == t.nodes && this.treeViewComponent == t.treeViewComponent;
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
				this.nodes[i].depth = depth + 1;
				this.nodes[i].isExpanded = !(false || this.nodes[i].nodes.length == 0);
				if (this.nodes[i].hasNodes)
					this.nodes[i].initializeDepth(depth + 1);
			}
		}
	
	}

}