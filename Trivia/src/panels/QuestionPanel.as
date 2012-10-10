package panels
{
	import flash.display.Sprite;
	import panels.question.ApplicationFacade;
	
	/**
	 * ...
	 * @author arneil mercado
	 */
	
	public class QuestionPanel extends Sprite
	{
		public static var EVALUATE:String = "EVALUATE_QUESTION";
		public static var PROCEED:String = "PROCEED";
		
		public static var FINISH_CATEGORY:String = "FINISH_CATEGORY_QUESTIONS";
		public static var FINISH_ALL:String = "FINISH_ALL";
		
		private var facade:ApplicationFacade;
		
		public function QuestionPanel(view:Object)
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