package components.treeview
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author arneil mercado
	 */
	public class TreeEvent extends Event
	{
		//node events
		public static var NODE_ADJUST:String = "NODE_ADJUST";
		public static var NODE_SELECT:String = "NODE_SELECT";
		//public static var NODE_CLOSE:String =  "NODE_CLOSE";
		
		private var _depth:int;
		private var _index:int;
		private var _startY:int;
		private var _subNodes:int;
		private var _node:TreeNode;
		
		public function TreeEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		
		}
		
		public override function clone():Event
		{
			return new TreeEvent(type, bubbles, cancelable);
		}
		
		public override function toString():String
		{
			return formatToString("TreeEvent", "type", "bubbles", "cancelable", "eventPhase");
		}
		
		public function get index():int 
		{
			return _index;
		}
		
		public function set index(value:int):void 
		{
			_index = value;
		}
		
		public function get depth():int 
		{
			return _depth;
		}
		
		public function set depth(value:int):void 
		{
			_depth = value;
		}
		
		public function get node():TreeNode 
		{
			return _node;
		}
		
		public function set node(value:TreeNode):void 
		{
			_node = value;
		}
		
		public function get startY():int 
		{
			return _startY;
		}
		
		public function set startY(value:int):void 
		{
			_startY = value;
		}
		
		public function get subNodes():int 
		{
			return _subNodes;
		}
		
		public function set subNodes(value:int):void 
		{
			_subNodes = value;
		}
	
	}

}