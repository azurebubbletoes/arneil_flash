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
		public const START_UPDATE:String = "START_UPDATE";
		public const END_UPDATE:String = "END_UPDATE";
		
		public const COLLAPSE:String = "COLLAPSE";
		public const CHANGE:String = "CHANGE";
		//private const ANIMATE:String = "ANIMATE";
		
		private var _isUpdating:Boolean;
		
		
		public function TreeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
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
		
		public function get isUpdating():Boolean 
		{
			return _isUpdating;
		}
		
		public function set isUpdating(value:Boolean):void 
		{
			_isUpdating = value;
		}
		
	}
	
}