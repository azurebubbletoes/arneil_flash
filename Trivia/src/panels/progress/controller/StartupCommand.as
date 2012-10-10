package panels.progress.controller
{
	/**
	 * ...
	 * @author arneil mercado
	 */
	//import org.puremvc.as3.multicore.patterns.command.AsyncCommand;
	//import org.puremvc.as3.multicore.interfaces.IAsyncCommand;
	import org.puremvc.as3.multicore.patterns.command.AsyncMacroCommand;
	
	public class StartupCommand extends AsyncMacroCommand
	{
		
		override protected function initializeAsyncMacroCommand():void
		{
			addSubCommand(ProxyInit);
			addSubCommand(MediatorInit);
		
		}
	
	}

}