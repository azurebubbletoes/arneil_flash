package
{
	import com.gskinner.motion.plugins.SmartRotationPlugin;
	import main.ApplicationFacade;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import others.Button;
	import panels.question.view.QuestionView;
	
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
			
			ApplicationFacade.getInstance(ApplicationFacade.START).startup(this.stage);
		
		/*var arr:Array = new Array(0, 0, 0, 0);
		   var val:Array = new Array(5, 7, 6, 8);
		   var index:Array= new Array();
		
		   for (var i:int = 0; i < arr.length; i++) // arr.length; i++)
		   {
		   var ix:int = Math.floor(Math.random() * 4);
		
		   var b:Boolean = false;
		   for (var j:int = 0; j < index.length; j++)
		   {
		   if (index[j] == ix)
		   {
		   b = true;
		   }
		   }
		
		   if (!b) {
		   index.push(ix);
		   }else
		   i--;
		   }
		
		   for (var x:int = 0; x < index.length; x++ )
		   trace(index[x]);
		 */
		}
	
	}

}