package QuizApp.controller
{
	/**
	 * ...
	 * @author arneil mercado
	 */
	import flash.display.Stage;
	import QuizApp.QuizApp;
	import QuizApp.view.QuizMediator;
	import org.puremvc.as3.multicore.interfaces.IAsyncCommand;
	import org.puremvc.as3.multicore.patterns.command.AsyncCommand;
	import org.puremvc.as3.multicore.interfaces.INotification;
	
	import QuizApp.view.CategoryMediator;
	
	public class ViewInitCmd extends AsyncCommand implements IAsyncCommand
	{
		
		override public function execute(notification:INotification):void
		{
			var stage:QuizApp = notification.getBody() as QuizApp;
			facade.registerMediator(new CategoryMediator(stage));
			facade.registerMediator(new QuizMediator(stage));
			commandComplete();
		}
	
	}

}