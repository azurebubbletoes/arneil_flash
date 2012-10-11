package QuizApp.view.panels.question.controller
{
	/**
	 * ...
	 * @author arneil mercado
	 */
	import QuizApp.view.panels.question.model.QuestionProxy;
	import org.puremvc.as3.multicore.interfaces.IAsyncCommand;
	import org.puremvc.as3.multicore.patterns.command.AsyncCommand;
	import org.puremvc.as3.multicore.interfaces.INotification;
	
	public class ModelInitCmd extends AsyncCommand implements IAsyncCommand
	{
		
		override public function execute(notification:INotification):void
		{
			
			facade.registerProxy(new QuestionProxy());
			commandComplete();
		}
	
	}

}