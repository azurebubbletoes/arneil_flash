package QuizApp.model
{
	/**
	 * ...
	 * @author arneil mercado
	 */
	import org.puremvc.as3.multicore.interfaces.IProxy;
	import org.puremvc.as3.multicore.patterns.proxy.Proxy;
	import QuizApp.view.components.others.Category;
	import QuizApp.view.components.others.Question;
	import QuizApp.model.vo.CategoriesData;
	
	public class CoreProxy extends Proxy implements IProxy
	{
		public static var NAME:String = "CORE_PROXY";
		
		public function CoreProxy()
		{
			super(NAME, new CategoriesData());
		}
		
		private function get vo():CategoriesData
		{
			return data as CategoriesData;
		}
		
		public function load():void
		{
			vo.load();
		}
		
		public function getAllCategories():Array
		{
			var categories:Array;
			
			for (var i:int = 0; i < vo.categories.length; i++)
			{
				categories.push(vo.categories[i].name);
			}
			return categories;
		}
		
		public function getNextQuestion(category:String):Question
		{
			var question:Question;
			
			for (var i:int = 0; i < vo.categories.length; i++)
			{
				if (vo.categories[i].name == category)
				{
					//var index:int = Math.floor((Math.random()*(vo.categories[i].questions.length)));
					
					//var j:int = 0;
					//while (j < vo.categories[i].questions.length)
					//{
					//	if (!vo.categories[i].questions[j].isAnswered)
					//	{
					//		question = vo.categories[i].questions[j];
					//		break;
					//	}
					//	j++;
					//}
					
					var index:int = Math.floor((Math.random() * (vo.categories[i].questions.length)));
					
					while (vo.categories[i].questions[index].isAnswered && !vo.categories[i].isDone())
					{
						index = Math.floor((Math.random() * (vo.categories[i].questions.length)));
						
					}
					
					question = vo.categories[i].questions[index];
					break;
					
				}
			}
			return question;
		
		}
		
		public function getNextCategory():String
		{
			var cat:String = "none";
			
			for (var i:int = 0; i < vo.categories.length; i++)
			{
				if (!vo.categories[i].isDone())
				{
					cat = vo.categories[i].name;
					break;
				}
				
			}
			
			return cat;
		}
		
		public function getCategory(name:String):Category
		{
			var cat:Category;
			for (var i:int = 0; i < vo.categories.length; i++)
			{
				if (vo.categories[i].name == name)
				{
					cat = vo.categories[i];
					break;
				}
			}
			return cat;
		}
		
		public function hasAnsweredAllTheQuestions(category:String):Boolean
		{
			var hasAnswered:Boolean = true;
			
			for (var i:int = 0; i < vo.categories.length; i++)
			{
				if (vo.categories[i].name == category)
				{
					
					hasAnswered = vo.categories[i].isDone();
					break;
					
				}
				
			}
			return hasAnswered;
		
		}
		
		public function hasAnsweredAllTheCategories():Boolean
		{
			var isDone:Boolean = true;
			
			for (var i:int = 0; i < vo.categories.length; i++)
			{
				
				isDone = isDone && vo.categories[i].isDone();
				
			}
			return isDone;
		}
		
		public function incrementAnswered(category:String, value:Boolean, question:String):void
		{
			//	trace("inside increment answered")
			for (var i:int = 0; i < vo.categories.length; i++)
			{
				//	trace("        category:" + category);
				//	trace("current category:" + vo.categories[i].name);
				
				if (vo.categories[i].name == category)
				{
					//		trace("--------------------------equal!")
					
					if (value)
					{
						
						vo.categories[i].correctAnswers++;
					}
					else
					{
						vo.categories[i].wrongAnswers++;
					}
					for (var j:int = 0; j < vo.categories[i].questions.length; j++)
					{
						
						if (question == vo.categories[i].questions[j].question)
							vo.categories[i].questions[j].isAnswered = true;
					}
					break;
					
				}
			}
			//vo.traceThis();
		}
	
	}

}