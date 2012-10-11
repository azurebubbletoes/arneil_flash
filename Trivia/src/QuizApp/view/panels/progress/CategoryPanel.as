package QuizApp.view.panels.progress
{
	import flash.display.Sprite;
	import flash.events.Event;
	import QuizApp.events.GlobalEvent;
	import QuizApp.view.components.others.Category;
	
	/**
	 * ...
	 * @author arneil mercado
	 */
	
	public class CategoryPanel extends Sprite
	{
		public static var SELECT:String = "CATEGORY_SELECT";
		public static var NEXT:String = "CATEGORY_NEXT";
		public static var PROGRESS:String = "CATEGORY_PROGRESS";
		public static var DISABLE:String = "CATEGORY_DISABLE";
		public static var ENABLE:String = "CATEGORY_ENABLE";
		
		private var facade:ApplicationFacade;
		
		public function CategoryPanel()
		{
			
			facade = ApplicationFacade.getInstance(ApplicationFacade.START);
			facade.startup(this);
		}
		
		/*public function sendNotification(notificationName:String, body:Object = null, type:String = null):void
		   {
		   facade.sendNotification(notificationName, body, type);
		 }*/
		
		public function enable():void
		{
			//trace("enable called");
			dispatchEvent(new Event(ENABLE, false, true));
			//facade.sendNotification(ENABLE);
		}
		
		public function disable():void
		{
			//trace("!enable called");
			dispatchEvent(new Event(DISABLE, false, true));
			//facade.sendNotification(DISABLE);
		}
		
		public function updateProgress(cat:Category):void
		{
			
			//trace("categorypanel.updateprogress!")
			
			var g:GlobalEvent = new GlobalEvent(PROGRESS, false, true);
			g.body = cat;
			dispatchEvent(g);
		
			//facade.sendNotification(PROGRESS, cat);
		}
		
		public function next(next:String):void
		{
			//trace("next called");
			
			//facade.sendNotification(NEXT, next);
			
			var g:GlobalEvent = new GlobalEvent(NEXT, false, true);
			g.body = next;
			dispatchEvent(g);
		
		}
	
	}

}