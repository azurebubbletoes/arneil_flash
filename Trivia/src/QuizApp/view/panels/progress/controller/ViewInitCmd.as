package QuizApp.view.panels.progress.controller
{
	/**
	 * ...
	 * @author arneil mercado
	 */
	
	import flash.display.Stage;
	import org.puremvc.as3.multicore.interfaces.IAsyncCommand;
	import org.puremvc.as3.multicore.patterns.command.AsyncCommand;
	import org.puremvc.as3.multicore.interfaces.INotification;
	import QuizApp.view.panels.progress.view.ProgressMediator;
	import QuizApp.view.panels.progress.CategoryPanel;
	
	public class ViewInitCmd extends AsyncCommand implements IAsyncCommand
	{
		
		override public function execute(notification:INotification):void
		{
			var stage:CategoryPanel = notification.getBody() as CategoryPanel;
			facade.registerMediator(new ProgressMediator(stage));
			
			commandComplete();
		}
	
	}

}