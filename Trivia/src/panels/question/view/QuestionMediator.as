package panels.question.view
{
	/**
	 * ...
	 * @author arneil mercado
	 */
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.utils.setTimeout;
	import others.GlobalEvent;
	
	import org.puremvc.as3.multicore.interfaces.IMediator;
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;
	import org.puremvc.as3.multicore.interfaces.INotification;
	import panels.question.model.QuestionProxy;
	import panels.QuestionPanel;
	import others.Button;
	import others.Question;
	
	public class QuestionMediator extends Mediator implements IMediator
	{
		public static const NAME:String = 'QuestionMediator';
		
		//public static const PROCEED:String = "PROCEED";
		
		private var view:QuestionView;
		private var _proxy:QuestionProxy;
		
		public function QuestionMediator(viewComponent:Object)
		{
			super(NAME, viewComponent);
		}
		
		override public function onRegister():void
		{
			view = new QuestionView();
			
			_proxy = facade.retrieveProxy(QuestionProxy.NAME) as QuestionProxy;
			
			sendNotification(QuestionView.INIT);
			viewComponent.addChild(view);
		
		}
		
		override public function listNotificationInterests():Array
		{
			return [QuestionView.INIT, QuestionView.LOAD, QuestionPanel.FINISH_CATEGORY, QuestionPanel.FINISH_ALL];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			var name:String = notification.getName();
			var body:Object = notification.getBody();
			
			switch (name)
			{
				case QuestionView.INIT:
					
					break;
				case QuestionView.LOAD:
					
					var question:Question = body as Question;
					
					view.category = question.category;
					view.a.removeEventListener(MouseEvent.CLICK, answerQuestion, false);
					view.b.removeEventListener(MouseEvent.CLICK, answerQuestion, false);
					view.c.removeEventListener(MouseEvent.CLICK, answerQuestion, false);
					view.d.removeEventListener(MouseEvent.CLICK, answerQuestion, false);
					
					view.answer = question.answer;
					view.removeChild(view.choices);
					removeComponents();
					//----------------------------------------------------------------------
					var arr:Array = new Array();
					var val:Array = question.choices;
					var index:Array = new Array();
					
					for (var i:int = 0; i < val.length; i++)
					{
						var ix:int = Math.floor(Math.random() * 4);
						
						var b:Boolean = false;
						for (var j:int = 0; j < index.length; j++)
						{
							if (index[j] == ix)
							{
								b = true;
							}
						}
						
						if (!b)
						{
							index.push(ix);
							arr.push(val[ix]);
						}
						else
							i--;
					}
					//----------------------------------------------------------------------
					view.questionname = question.question;
					view.choicesArray = arr;
					
					view.draw();
					
					addComponents();
					view.addChild(view.choices);
					
					view.a.addEventListener(MouseEvent.CLICK, answerQuestion, false, 0, true);
					view.b.addEventListener(MouseEvent.CLICK, answerQuestion, false, 0, true);
					view.c.addEventListener(MouseEvent.CLICK, answerQuestion, false, 0, true);
					view.d.addEventListener(MouseEvent.CLICK, answerQuestion, false, 0, true);
					
					break;
				
				case QuestionPanel.FINISH_CATEGORY:
					
					removeComponents();
					
					view.questionname = "you have answered all the questions for this category."
					
					var choices:Array = new Array("NEXT CATEGORY >>", "", "", "");
					view.choicesArray = choices;
					
					view.draw();
					addComponents();
					
					view.a.addEventListener(MouseEvent.CLICK, function(e:Event):void
						{
							
							view.a.removeEventListener(MouseEvent.CLICK, function(e:Event):void
								{
								}, false);
							
							(viewComponent as Stage).dispatchEvent(new Event(QuestionPanel.PROCEED, false, true));
						},
						
						false, 0, true);
					
					break;
				case QuestionPanel.FINISH_ALL: 
					removeComponents();
					
					view.questionname = "you have answered everything."
					
					var ch:Array = new Array("", "", "", "");
					view.choicesArray = ch;
					
					view.draw();
					addComponents();
					
					break;
			
			}
		}
		
		private function removeComponents():void
		{
			view.removeChild(view.question);
			view.choices.removeChild(view.a);
			view.choices.removeChild(view.b);
			view.choices.removeChild(view.c);
			view.choices.removeChild(view.d);
		
		}
		
		private function addComponents():void
		{
			view.addChild(view.question)
			view.choices.addChild(view.a);
			view.choices.addChild(view.b);
			view.choices.addChild(view.c);
			view.choices.addChild(view.d);
		}
		
		private function answerQuestion(e:Event):void
		{
			var answer:Button = e.currentTarget as Button;
			var g:GlobalEvent = new GlobalEvent(QuestionPanel.EVALUATE, true, true);
			
			var value:Array = new Array(view.category, answer.label == view.answer, view.questionname);
			
			//trace("aaaaaaaaaaaa")
			
			g.body = value;
			
			(viewComponent as Stage).dispatchEvent(g);
		
		}
	
	}

}