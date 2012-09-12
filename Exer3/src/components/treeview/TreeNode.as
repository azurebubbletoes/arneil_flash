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
		private var _expandNodes:Boolean;
		
		
		
		public function TreeNode(ref:TreeViewComponent, id:String, name:String)
		{
			
			this._id = id;
			this._name = name;
			this._expandNodes = true;
			
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
		
		public function initializeDepth(depth:Number):void
		{
			this.depth = depth;
			
			if (this.nodes.length > 0)
			{
				for (var i:int = 0; i < this.nodes.length;i++ )
					this.nodes[i].initializeDepth(depth+1);
			}
		
		}
		
		public function draw():void
		{
			var tree:TreeViewComponent = this.treeViewComponent;
			var x:Number = tree.startX+(this.depth *tree.horizontalIndent); 
			var y:Number = tree.startY+(this.depth *tree.verticalIndent); 
			var width:Number = tree.maxWidth + tree.startX - x;
			var height:Number=tree.maxHeight + tree.startY - y;
			
			
			//_button = new Button(this.name, x, y, width, height, b ? "+" : "-");
			//_button.addEventListener(MouseEvent.CLICK, nodeClick, false, 0, true);
			
			//addChild(_button);
		
		}
		
		public function nodeClick(e:Event):void
		{
		}
		
	
		
		public function equals(t:TreeNode):Boolean
		{
			return this.id == t.id && this.name == name && this.nodes == t.nodes && this.treeViewComponent == t.treeViewComponent;
		}
		
		//public function containsNode(t:TreeNode):Boolean
		//{
		//}
	}

}