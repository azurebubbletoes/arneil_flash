package  
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	/**
	 * ...
	 * @author arneil mercado
	 */
	public interface IRunner extends IEventDispatcher
	{
		function play():void;
		function stop():void;
		function destroy():void;
		//function status():String;
	}
	
}