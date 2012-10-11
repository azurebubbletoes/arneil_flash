package
{
	import com.gskinner.motion.plugins.SmartRotationPlugin;
	import QuizApp.ApplicationFacade;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import QuizApp.view.components.others.Button;
	import QuizApp.view.panels.question.view.QuestionView;
	import QuizApp.QuizApp;
	
	//import ques.view.ProgressView;
	
	/**
	 * ...
	 * @author arneil mercado
	 */
	public class Main extends Sprite
	{
		
		public function Main():void
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			//ApplicationFacade.getInstance(ApplicationFacade.START).startup(this.stage);
			addChild(new QuizApp());
		
		}
	
	}

}