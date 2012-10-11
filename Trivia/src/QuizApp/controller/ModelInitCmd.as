package QuizApp.controller
{
	/**
	 * ...
	 * @author arneil mercado
	 */
	import QuizApp.model.CoreProxy;
	import org.puremvc.as3.multicore.interfaces.IAsyncCommand;
	import org.puremvc.as3.multicore.patterns.command.AsyncCommand;
	import org.puremvc.as3.multicore.interfaces.INotification;
	
	public class ModelInitCmd extends AsyncCommand implements IAsyncCommand
	{
		
		override public function execute(notification:INotification):void
		{
			
			facade.registerProxy(new CoreProxy());
			commandComplete();
		}
	
	}

}