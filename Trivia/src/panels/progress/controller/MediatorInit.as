package panels.progress.controller
{
	/**
	 * ...
	 * @author arneil mercado
	 */
	
	import flash.display.Stage;
	import org.puremvc.as3.multicore.interfaces.IAsyncCommand;
	import org.puremvc.as3.multicore.patterns.command.AsyncCommand;
	import org.puremvc.as3.multicore.interfaces.INotification;
	import panels.progress.view.ProgressMediator;
	
	public class MediatorInit extends AsyncCommand implements IAsyncCommand
	{
		
		override public function execute(notification:INotification):void
		{
			var stage:Stage = notification.getBody() as Stage;
			facade.registerMediator(new ProgressMediator(stage));
			
			commandComplete();
		}
	
	}

}