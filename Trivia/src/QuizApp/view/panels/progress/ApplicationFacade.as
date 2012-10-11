package QuizApp.view.panels.progress
{
	/**
	 * ...
	 * @author arneil mercado
	 */
	
	import org.puremvc.as3.multicore.interfaces.IFacade;
	import org.puremvc.as3.multicore.patterns.facade.Facade;
	import QuizApp.view.panels.progress.controller.StartupCmd;
	import org.puremvc.as3.multicore.patterns.observer.Notification;
	
	public class ApplicationFacade extends Facade implements IFacade
	{
		public static var START:String = "CATEGORY_START";
		
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
		
		public function startup(app:CategoryPanel):void
		{
			sendNotification(START, app)
		}
		
		override public function sendNotification(notificationName:String, body:Object = null, type:String = null):void
		{
			//trace('Sent ' + notificationName);
			
			notifyObservers(new Notification(notificationName, body, type));
		}
	}

}