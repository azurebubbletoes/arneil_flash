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
		
		public function draw(x:Number, y:Number, width:Number, height:Number):Number
		{
			
			var b:Boolean = this.nodes.length > 0;
			var h:Number = 0;
			_button = new Button(this.name, x, y, width, height, b ? "+" : "-");
			_button.addEventListener(MouseEvent.CLICK, nodeClick, false, 0, true);
			
			addChild(_button);
			
			if (b)
			{
				
				for (var i:int = 0; i < this.nodes.length; i++)
				{
					h += this.nodes[i].draw(x + 20, y + h + height, width, height);
					
					this.addChild(this.nodes[i]);
				}
				
			}
			toggleCollapse();
			return height+h;
		
		}
		
		public function nodeClick(e:Event):void
		{
			
			var n:Vector.<TreeNode> = this.treeViewComponent.nodes;
			var node:TreeNode;
			for (var i:int = 0; i < n.length; i++)
			{
				if (!n[i].containsNode(this))
				{
					if (n[i]._expandNodes)
					{
						//node = n[i];
						n[i].toggleCollapse();
						;
						break;
					}
				}
				
			}
			//node.toggleCollapse();
			
			if (this.nodes.length > 0)
			{
				toggleCollapse();
				//	var heightMultiplier:Number=getNumberOfChildren(this);
				//var startY:Number = _button._height + _button._y;
				
				//for (var j:int = 0; j < n.length; j++)
				//{
					
				//}
			}
		
		}
		
		public function containsNode(t:TreeNode):Boolean
		{
			var flag:Boolean = this.equals(t);
			
			if (!flag && this.nodes.length > 0)
			{
				for (var i:int = 0; i < this.nodes.length; i++)
				{
					flag = flag || this.nodes[i].containsNode(t);
				}
			}
			return flag;
		}
		
		public function toggleCollapse(showChildren:Boolean = false):void
		{
			
			if (this.nodes.length > 0)
			{
				
				if (_expandNodes)
				{
					for (var i:int = 0; i < this.nodes.length; i++)
					{
						removeChild(this.nodes[i]);
					}
					
					_expandNodes = false;
				}
				else
				{
					for (var j:int = 0; j < this.nodes.length; j++)
					{
						this.addChild(this.nodes[j]);
					}
					_expandNodes = true;
				}
			}
		
		}
		
		public function equals(t:TreeNode):Boolean
		{
			return this.id == t.id && this.name == name && this.nodes == t.nodes && this.treeViewComponent == t.treeViewComponent;
		}
		
		/*(public function getNumberOfChildren(node:TreeNode):Number
		   {
		   var x:Number= node.nodes.length;
		
		   for (var j:int = 0; j < node.nodes.length; j++)
		   {
		   x+=getNumberOfChildren(node.nodes[j]);
		   }
		   return x;
		   }
		 
		public function adjustHeight(h:Number):void
		{
			_button.height = h;
		}*/
	}

}