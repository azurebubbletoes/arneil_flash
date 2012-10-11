package QuizApp.view.panels.question.controller
{
	/**
	 * ...
	 * @author arneil mercado
	 */
	
	import flash.display.Stage;
	import org.puremvc.as3.multicore.interfaces.IAsyncCommand;
	import org.puremvc.as3.multicore.patterns.command.AsyncCommand;
	import org.puremvc.as3.multicore.interfaces.INotification;
	import QuizApp.view.panels.question.view.QuestionMediator;
	import QuizApp.view.panels.question.QuestionPanel;
	
	public class ViewInitCmd extends AsyncCommand implements IAsyncCommand
	{
		
		override public function execute(notification:INotification):void
		{
			var stage:QuestionPanel = notification.getBody() as QuestionPanel;
			facade.registerMediator(new QuestionMediator(stage));
			
			commandComplete();
		}
	
	}

}