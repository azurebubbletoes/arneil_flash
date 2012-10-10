package panels.question
{
	/**
	 * ...
	 * @author arneil mercado
	 */
	
	import org.puremvc.as3.multicore.interfaces.IFacade;
	import org.puremvc.as3.multicore.patterns.facade.Facade;
	import panels.question.controller.StartupCommand;
	import org.puremvc.as3.multicore.patterns.observer.Notification;
	
	public class ApplicationFacade extends Facade implements IFacade
	{
		public static var START:String = "QUESTION_START";
		
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
			registerCommand(START, StartupCommand);
		}
		
		public function startup(app:Object):void
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