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
		private var _startX:Number;
		private var _startY:Number;
		
		private var _maxWidth:Number;
		private var _maxHeight:Number;
		
		private var _horizontalIndent:Number;
		private var _verticalIndent:Number;
		
		private var _useTween:Boolean;
		private var _autoCollapseWhenNotViewed:Boolean;
		
		private var _nodes:Vector.<TreeNode> //root Node
		
		//private var _isUpdating:Boolean;
		
		public function TreeViewComponent()
		{
			_nodes = new Vector.<TreeNode>();
			
			_startX = 50;
			_startY= 50;
		
			_maxWidth = 300;
			_maxHeight = 30;
		
			_horizontalIndent=20;
			_verticalIndent=3;
			//_nodes.
			//this._isUpdating = false;
		}
		
		private function drawNodes():void
		{
			
			
		
		}
		
		private function initializeDepth():void
		{
			for (var i:int = 0; i < _nodes.length; i++)
			{
				_nodes[i].initializeDepth(0); // initializes the depth of the node and it's branches..
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
			initializeDepth();
			drawNodes();
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
		
		public function get startX():Number 
		{
			return _startX;
		}
		
		public function set startX(value:Number):void 
		{
			_startX = value;
		}
		
		public function get startY():Number 
		{
			return _startY;
		}
		
		public function set startY(value:Number):void 
		{
			_startY = value;
		}
		
		public function get maxWidth():Number 
		{
			return _maxWidth;
		}
		
		public function set maxWidth(value:Number):void 
		{
			_maxWidth = value;
		}
		
		public function get maxHeight():Number 
		{
			return _maxHeight;
		}
		
		public function set maxHeight(value:Number):void 
		{
			_maxHeight = value;
		}
		
		public function get horizontalIndent():Number 
		{
			return _horizontalIndent;
		}
		
		public function set horizontalIndent(value:Number):void 
		{
			_horizontalIndent = value;
		}
		
		public function get verticalIndent():Number 
		{
			return _verticalIndent;
		}
		
		public function set verticalIndent(value:Number):void 
		{
			_verticalIndent = value;
		}
		
	
	
	}

}