package QuizApp
{
	/**
	 * ...
	 * @author arneil mercado
	 */
	import flash.display.Sprite;
	import flash.display.Stage;
	
	public class QuizApp extends Sprite
	{
		
		public function QuizApp()
		{
			ApplicationFacade.getInstance(ApplicationFacade.START).startup(this);
		}
	
	}

}