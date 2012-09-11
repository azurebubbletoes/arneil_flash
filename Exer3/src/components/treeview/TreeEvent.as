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
		private const COLLAPSE:String = "COLLAPSE";
		private const CHANGE:String = "CHANGE";
		//private const ANIMATE:String = "ANIMATE";
		//private const 
		
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
		
	}
	
}