package QuizApp.view.panels.question
{
	import flash.display.Sprite;
	import flash.events.Event;
	import QuizApp.events.GlobalEvent;
	
	/**
	 * ...
	 * @author arneil mercado
	 */
	
	public class QuestionPanel extends Sprite
	{
		public static var EVALUATE:String = "EVALUATE_QUESTION";
		public static var PROCEED:String = "PROCEED";
		public static var LOAD:String = "QUESTION_LOAD";
		public static var FINISH_CATEGORY:String = "FINISH_CATEGORY_QUESTIONS";
		public static var FINISH_ALL:String = "FINISH_ALL";
		
		private var facade:ApplicationFacade;
		
		public function QuestionPanel()
		{
			
			facade = ApplicationFacade.getInstance(ApplicationFacade.START);
			facade.startup(this);
		}
		
		public function sendNotification(notificationName:String, body:Object = null, type:String = null):void
		{
			facade.sendNotification(notificationName, body, type);
		}
		
		public function finishAll():void
		{
			dispatchEvent(new Event(QuestionPanel.FINISH_ALL));
		
			//facade.sendNotification(QuestionPanel.FINISH_ALL);
		}
		
		public function finishCategory():void
		{
			dispatchEvent(new Event(QuestionPanel.FINISH_CATEGORY));
			//facade.sendNotification(QuestionPanel.FINISH_CATEGORY);
		}
		
		public function loadQuestion(body:Object):void
		{
			var g:GlobalEvent = new GlobalEvent(LOAD, false, true);
			g.body = body;
			dispatchEvent(g);
			//facade.sendNotification(LOAD, body);
		}
	}

}