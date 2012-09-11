package components.treeview
{
	import flash.display.Sprite;
	import components.treeview.TreeEvent;
	import flash.events.EventDispatcher;
	
	/**
	 * ...
	 * @author arneil mercado
	 */
	public class TreeViewComponent extends Sprite
	{
		public const _x:Number=50;
		public const _y:Number=50;
		
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
			trace("draw");
			for (var i:int= 0; i < _nodes.length; i++ )
				_nodes[i].draw();
			
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