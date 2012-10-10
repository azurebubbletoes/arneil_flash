package main.view
{
	/**
	 * ...
	 * @author arneil mercado
	 */
	import flash.events.Event;
	import org.puremvc.as3.multicore.interfaces.IMediator;
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;
	import org.puremvc.as3.multicore.interfaces.INotification;
	import others.GlobalEvent;
	
	import panels.CategoryPanel;
	import panels.question.view.QuestionView;
	import main.model.CoreProxy;
	import panels.progress.model.ProgressProxy;
	
	import flash.display.Stage;
	import others.Button;
	import others.Question
	
	public class CategoryMediator extends Mediator implements IMediator
	{
		public static var NAME:String = "CATEGORY_MEDIATOR";
		
		public static var LOAD_QUESTION:String = "CATEGORY_MEDIATOR_LOAD_QUESTION";
		public static var NEXT_CATEGORY:String = "CATEGORY_MEDIATOR_NEXT";
		public static var PROGRESS_CATEGORY:String = "CATEGORY_MEDIATOR_PROGRESS";
		public static var ENABLE:String = "CATEGORY_MEDIATOR_ENABLE";
		public static var DISABLE:String = "CATEGORY_MEDIATOR_DISABLE";
		public static var INIT:String = "CATEGORY_MEDIATOR_INIT";
		
		private var view:CategoryPanel;
		private var _proxy:CoreProxy;
		
		public function CategoryMediator(viewComponent:Object)
		{
			super(NAME, viewComponent);
		}
		
		override public function onRegister():void
		{
			view = new CategoryPanel(viewComponent);
			
			_proxy = facade.retrieveProxy(CoreProxy.NAME) as CoreProxy;
			
			(viewComponent as Stage).addEventListener(LOAD_QUESTION, handleSelection, false, 0, true);
			(viewComponent as Stage).addEventListener(PROGRESS_CATEGORY, handleNextCategory, false, 0, true);
			
			viewComponent.addChild(view);
			//	sendNotification(CategoryMediator.NEXT_CATEGORY);
			sendNotification(CategoryMediator.INIT);
			facade.registerMediator(new QuizMediator(viewComponent));
		}
		
		override public function listNotificationInterests():Array
		{
			return [CategoryMediator.LOAD_QUESTION, CategoryMediator.NEXT_CATEGORY, CategoryMediator.PROGRESS_CATEGORY, CategoryMediator.ENABLE, CategoryMediator.DISABLE, CategoryMediator.INIT];
		}
		
		private function handleSelection(e:GlobalEvent):void
		{
			sendNotification(CategoryMediator.LOAD_QUESTION, e.body);
		}
		
		private function handleNextCategory(e:GlobalEvent):void
		{
			sendNotification(CategoryMediator.PROGRESS_CATEGORY, e.body);
		}
		
		override public function handleNotification(notification:INotification):void
		{
			var name:String = notification.getName();
			var body:Object = notification.getBody();
			
			switch (name)
			{
				case CategoryMediator.INIT:
					
					_proxy.load();
					//sendNotification(CategoryMediator.NEXT_CATEGORY);
					break;
				
				case CategoryMediator.LOAD_QUESTION:
					
					var b:String = body as String;
					
					var question:Question = _proxy.getNextQuestion(b);
					
					if (question != null)
					{
						facade.sendNotification(QuizMediator.LOAD_QUESTION, question);
					}
					else
					{
						//sendNotification(CategoryMediator.DISABLE);
						
						if (_proxy.hasAnsweredAllTheCategories())
						{
							facade.sendNotification(QuizMediator.CATEGORY_IS_FINISHED);
						}
						else
						{
							facade.sendNotification(QuizMediator.FINISH_CATEGORY);
						}
						sendNotification(CategoryMediator.PROGRESS_CATEGORY, b);
					}
					
					//sendNotification(CategoryMediator.PROGRESS_CATEGORY,b.label);
					break;
				
				case CategoryMediator.NEXT_CATEGORY:
					
					var string:String = _proxy.getNextCategory();
					view.sendNotification(CategoryPanel.NEXT, string);
					
					var button:Button = new Button(string, 100)
					sendNotification(CategoryMediator.LOAD_QUESTION, button.label); //next question
					facade.sendNotification(CategoryMediator.PROGRESS_CATEGORY, string); //next question
					
					break;
				case CategoryMediator.PROGRESS_CATEGORY:
					
					var cat:String = body as String;
					
					view.sendNotification(CategoryPanel.PROGRESS, _proxy.getCategory(cat));
					
					break;
				case CategoryMediator.ENABLE: 
					view.sendNotification(CategoryPanel.ENABLE);
					break;
				case CategoryMediator.DISABLE: 
					view.sendNotification(CategoryPanel.DISABLE);
					break;
			}
		}
	}

}