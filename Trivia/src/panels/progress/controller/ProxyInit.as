package panels.progress.controller
{
	/**
	 * ...
	 * @author arneil mercado
	 */
	import panels.progress.model.ProgressProxy;
	import org.puremvc.as3.multicore.interfaces.IAsyncCommand;
	import org.puremvc.as3.multicore.patterns.command.AsyncCommand;
	import org.puremvc.as3.multicore.interfaces.INotification;
	
	public class ProxyInit extends AsyncCommand implements IAsyncCommand
	{
		
		override public function execute(notification:INotification):void
		{
			
			facade.registerProxy(new ProgressProxy());
			commandComplete();
		}
	
	}

}