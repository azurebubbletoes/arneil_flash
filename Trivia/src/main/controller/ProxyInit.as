package main.controller
{
	/**
	 * ...
	 * @author arneil mercado
	 */
	import main.model.CoreProxy;
	import org.puremvc.as3.multicore.interfaces.IAsyncCommand;
	import org.puremvc.as3.multicore.patterns.command.AsyncCommand;
	import org.puremvc.as3.multicore.interfaces.INotification;
	
	public class ProxyInit extends AsyncCommand implements IAsyncCommand
	{
		
		override public function execute(notification:INotification):void
		{
			
			facade.registerProxy(new CoreProxy());
			commandComplete();
		}
	
	}

}