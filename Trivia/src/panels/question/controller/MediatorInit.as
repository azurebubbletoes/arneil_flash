package panels.question.controller
{
	/**
	 * ...
	 * @author arneil mercado
	 */
	
	import flash.display.Stage;
	import org.puremvc.as3.multicore.interfaces.IAsyncCommand;
	import org.puremvc.as3.multicore.patterns.command.AsyncCommand;
	import org.puremvc.as3.multicore.interfaces.INotification;
	import panels.question.view.QuestionMediator;
	
	public class MediatorInit extends AsyncCommand implements IAsyncCommand
	{
		
		override public function execute(notification:INotification):void
		{
			var stage:Stage = notification.getBody() as Stage;
			facade.registerMediator(new QuestionMediator(stage));
			
			commandComplete();
		}
	
	}

}