package QuizApp.controller
{
	/**
	 * ...
	 * @author arneil mercado
	 */
	import org.puremvc.as3.multicore.patterns.command.AsyncMacroCommand;
	
	public class StartupCmd extends AsyncMacroCommand
	{
		
		override protected function initializeAsyncMacroCommand():void
		{
			addSubCommand(ModelInitCmd);
			addSubCommand(ViewInitCmd);
		
		}
	
	}

}