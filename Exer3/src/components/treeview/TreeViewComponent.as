package components.treeview
{
	import flash.display.Sprite;
	import components.treeview.TreeEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.EventDispatcher;
	
	/**
	 * ...
	 * @author arneil mercado
	 */
	public class TreeViewComponent extends Sprite
	{
		private var _startX:Number;
		private var _startY:Number;
		
		//	private var _maxWidth:Number;
		//	private var _maxHeight:Number;
		
		private var _horizontalIndent:Number;
		private var _verticalIndent:Number;
		
		private var _useTween:Boolean;
		private var _autoCollapseWhenNotViewed:Boolean;
		
		private var _nodes:TreeNodeList //root Node
		
		//private var _isUpdating:Boolean;
		
		public function TreeViewComponent()
		{
			_startX = 50;
			_startY = 50;
			
			_nodes = new TreeNodeList();
			addChild(this.nodes);
			this.nodes.x = 50;
			this.nodes.y = 50;
			
			//_maxWidth = 300;
			//_maxHeight = 30;
			
			_horizontalIndent = 10;
			_verticalIndent = 3;
			_autoCollapseWhenNotViewed = false;
			//_nodes.
			//this._isUpdating = false;
		}
		
		private function drawRootNodes():void
		{
			
			this.nodes.initializeDepth(0);
			this.nodes.createNodes();
		
		}
		
		internal function closeNodes(node:TreeNode):void
		{
			this.nodes.closeNodes(node);
		}
		
		internal function adjustHeight(node:TreeNode,hasPassed:Boolean=false):void
		{	
			trace("starting height adjustment of node:"+node.name);
			this.nodes.adjustHeight(node);
		}
		
		public function beginUpdate():void
		{
		
		}
		
		public function endUpdate():void
		{
			
			drawRootNodes();
		}
		
		public function clear():void
		{
		
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
		
		public function get autoCollapseWhenNotViewed():Boolean
		{
			return _autoCollapseWhenNotViewed;
		}
		
		public function set autoCollapseWhenNotViewed(value:Boolean):void
		{
			_autoCollapseWhenNotViewed = value;
		}
		
		public function get nodes():TreeNodeList
		{
			return _nodes;
		}
		
		public function set nodes(value:TreeNodeList):void
		{
			_nodes = value;
		}
	
	}
}
