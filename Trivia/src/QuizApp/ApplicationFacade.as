package QuizApp
{
	/**
	 * ...
	 * @author arneil mercado
	 */
	import org.puremvc.as3.multicore.interfaces.IFacade;
	import org.puremvc.as3.multicore.patterns.facade.Facade;
	import QuizApp.controller.StartupCmd;
	
	public class ApplicationFacade extends Facade implements IFacade
	{
		
		public static var START:String = "START_APPLICATION";
		
		public function ApplicationFacade(key:String)
		{
			super(key);
		}
		
		public static function getInstance(key:String):ApplicationFacade
		{
			instanceMap[key] ||= new ApplicationFacade(key);
			return instanceMap[key] as ApplicationFacade;
		}
		
		override protected function initializeController():void
		{
			super.initializeController();
			registerCommand(START, StartupCmd);
		}
		
		public function startup(app:QuizApp):void
		{
			sendNotification(START, app)
		}
	}

}