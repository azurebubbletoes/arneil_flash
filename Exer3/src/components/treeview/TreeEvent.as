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
		public static var BREADCRUMB:String =  "GET_PATH";
		
		//private var _depth:int;
		//private var _index:int;
		//private var _startY:int;
		//private var _subNodes:int;
		private var _node:TreeNode;
		private var _adjustmentHeight:Number;
		private var _path:String;
		
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
		
		public function get node():TreeNode
		{
			return _node;
		}
		
		public function set node(value:TreeNode):void
		{
			_node = value;
		}
		
		public function get adjustmentHeight():Number
		{
			return _adjustmentHeight;
		}
		
		public function set adjustmentHeight(value:Number):void
		{
			_adjustmentHeight = value;
		}
		
		public function get path():String 
		{
			return _path;
		}
		
		public function set path(value:String):void 
		{
			_path = value;
		}
	
	}

}