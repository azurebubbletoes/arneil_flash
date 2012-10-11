package QuizApp.view.panels.question.model
{
	/**
	 * ...
	 * @author arneil mercado
	 */
	import org.puremvc.as3.multicore.interfaces.IProxy;
	import org.puremvc.as3.multicore.patterns.proxy.Proxy;
	import flash.events.Event;
	import flash.display.Sprite;
	
	import QuizApp.view.components.others.Question;
	
	public class QuestionProxy extends Proxy implements IProxy
	{
		public static var NAME:String = "QuestionProxy";
		
		public function QuestionProxy()
		{
			
			super(NAME, new Question()); // ("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut?", s, "a"));
		
		}
		
		private function get vo():Question
		{
			return data as Question;
		}
		
		public function getQuestion():String
		{
			//trace(vo.formatString("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut?"));
			return "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut?";
		}
	
	}

}