package main.view
{
	/**
	 * ...
	 * @author arneil mercado
	 */
	import flash.display.Stage;
	import org.puremvc.as3.multicore.interfaces.IMediator;
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;
	import org.puremvc.as3.multicore.interfaces.INotification;
	import others.Button;
	import others.GlobalEvent;
	import panels.QuestionPanel;
	import panels.question.view.QuestionView;
	import main.model.CoreProxy;
	import flash.events.Event; //  .model.CoreProxy;
	
	public class QuizMediator extends Mediator implements IMediator
	{
		public static var NAME:String = "QUIZ_MEDIATOR";
		public static var LOAD_QUESTION:String = "QUIZ_MEDIATOR_LOAD";
		public static var FINISH_CATEGORY:String = "QUIZ_MEDIATOR_FINISH_CATEGORY";
		public static var CATEGORY_IS_FINISHED:String = "QUIZ_MEDIATOR_CATEGORY_IS_FINISHED";
		
		private var view:QuestionPanel;
		private var _proxy:CoreProxy;
		
		public function QuizMediator(viewComponent:Object)
		{
			super(NAME, viewComponent);
		}
		
		override public function onRegister():void
		{
			view = new QuestionPanel(viewComponent);
			
			_proxy = facade.retrieveProxy(CoreProxy.NAME) as CoreProxy;
			(viewComponent as Stage).addEventListener(QuestionPanel.EVALUATE, evaluate, false, 0, true);
			(viewComponent as Stage).addEventListener(QuestionPanel.PROCEED, proceed, false, 0, true);
			
			viewComponent.addChild(view);
		
		}
		
		override public function listNotificationInterests():Array
		{
			return [LOAD_QUESTION, FINISH_CATEGORY, QuestionPanel.EVALUATE, CATEGORY_IS_FINISHED];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			var name:String = notification.getName();
			var body:Object = notification.getBody();
			
			switch (name)
			{
				case LOAD_QUESTION:
					
					view.sendNotification(QuestionView.LOAD, body);
					
					break;
				
				case QuestionPanel.EVALUATE:
					
					_proxy.incrementAnswered(body[0], body[1], body[2]);
					
					if (_proxy.hasAnsweredAllTheCategories())
					{
						//facade.sendNotification(CategoryMediator.DISABLE);
						sendNotification(CATEGORY_IS_FINISHED);
					}
					else
					{
						if (!_proxy.hasAnsweredAllTheQuestions(body[0]))
						{
							
							var button:Button = new Button(body[0], 100)
							facade.sendNotification(CategoryMediator.LOAD_QUESTION, body[0]); //next question
							
						}
						else
						{
							sendNotification(FINISH_CATEGORY);
						}
						
					}
					facade.sendNotification(CategoryMediator.PROGRESS_CATEGORY, body[0]);
					break;
				
				case FINISH_CATEGORY: 
					//facade.sendNotification(CategoryMediator.DISABLE);
					view.sendNotification(QuestionPanel.FINISH_CATEGORY);
					break;
				case CATEGORY_IS_FINISHED: 
					view.sendNotification(QuestionPanel.FINISH_ALL);
					break;
			
			}
		}
		
		private function evaluate(e:GlobalEvent):void
		{
			
			sendNotification(QuestionPanel.EVALUATE, e.body);
		
		}
		
		private function proceed(e:Event):void
		{
			//facade.sendNotification(CategoryMediator.ENABLE);
			facade.sendNotification(CategoryMediator.NEXT_CATEGORY);
		
		}
	
	}

}