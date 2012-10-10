package main.controller
{
	/**
	 * ...
	 * @author arneil mercado
	 */
	import flash.display.Stage;
	import main.view.QuizMediator;
	import org.puremvc.as3.multicore.interfaces.IAsyncCommand;
	import org.puremvc.as3.multicore.patterns.command.AsyncCommand;
	import org.puremvc.as3.multicore.interfaces.INotification;
	
	import main.view.CategoryMediator;
	
	public class MediatorInit extends AsyncCommand implements IAsyncCommand
	{
		
		override public function execute(notification:INotification):void
		{
			var stage:Stage = notification.getBody() as Stage;
			facade.registerMediator(new CategoryMediator(stage));
			
			commandComplete();
		}
	
	}

}