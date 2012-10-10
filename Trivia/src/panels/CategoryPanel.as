package panels
{
	import flash.display.Sprite;
	import panels.progress.ApplicationFacade;
	
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
		
		public function CategoryPanel(view:Object)
		{
			
			facade = ApplicationFacade.getInstance(ApplicationFacade.START);
			facade.startup(view);
		}
		
		public function sendNotification(notificationName:String, body:Object = null, type:String = null):void
		{
			facade.sendNotification(notificationName, body, type);
		}
	}

}