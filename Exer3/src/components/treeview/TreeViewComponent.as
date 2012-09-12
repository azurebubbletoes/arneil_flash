package components.treeview
{
	import flash.display.Sprite;
	import components.treeview.TreeEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	/**
	 * ...
	 * @author arneil mercado
	 */
	public class TreeViewComponent extends Sprite
	{
		public var _x:Number = 50;
		public var _y:Number = 50;
		public var _width:Number = 300;
		public var _height:Number = 30;
		
		private var _nodes:Vector.<TreeNode> //root Node
		
		//private var _isUpdating:Boolean;
		
		public function TreeViewComponent()
		{
			_nodes = new Vector.<TreeNode>();
			//_nodes.
			//this._isUpdating = false;
		}
		
		private function draw():void
		{
			var y:Number = _y;
			for (var i:int = 0; i < _nodes.length; i++)// , y += _height)
			{
				
				y+=_nodes[i].draw(_x, y, _width, _height);

				addChild(_nodes[i]);
			}
							
		}
		
		public function beginUpdate():void
		{
			//var e:TreeEvent = new TreeEvent(e.START_UPDATE, false, true);
			//this._isUpdating = true;
			//e.isUpdating = true;
			//dispatchEvent(e);
		
		}
		
		public function endUpdate():void
		{
			//var e:TreeEvent = new TreeEvent(e.END_UPDATE, false, true);
			//e.isUpdating = false;
			//this._isUpdating = false;
			//dispatchEvent(e);
			draw();
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