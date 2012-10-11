package QuizApp.model.vo
{
	import flash.sampler.NewObjectSample;
	import QuizApp.view.components.others.Category;
	import QuizApp.view.components.others.Question;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.Event
	import flash.events.EventDispatcher;
	
	/**
	 * ...
	 * @author arneil mercado
	 */
	public class CategoriesData
	{
		private var _categories:Vector.<Category>;
		
		public function CategoriesData()
		{
			_categories = new Vector.<Category>();
			//load();
			//load();
			//CreateDisplay();
		}
		
		public function get categories():Vector.<Category>
		{
			return _categories;
		}
		
		public function set categories(value:Vector.<Category>):void
		{
			_categories = value;
		}
		
		public function load():void
		{
			var loader:URLLoader = new URLLoader();
			loader.dataFormat = "xml";
			loader.addEventListener(Event.COMPLETE, HandleXML);
			loader.load(new URLRequest("xml/questions.xml"));
		}
		
		private function HandleXML(e:Event):void
		{
			
			try
			{
				var xml:XML = new XML(e.target.data);
				
				for (var i:int = 0; i < xml.category.length(); i++)
				{
					
					var xxml:XML = xml.category[i];
					
					if (xxml.question.length() > 0)
					{
						
						var cat:Category = new Category();
						var questions:Vector.<Question> = new Vector.<Question>();
						cat.name = xxml.@name;
						
						for (var j:int = 0; j < xxml.question.length(); j++)
						{
							questions[j] = new Question();
							var question:Question = questions[j];
							var qXML:XML = xxml.question[j];
							
							var arr:Array = new Array();
							question.question = qXML.@name;
							
							question.answer = qXML.@answer;
							arr.push(qXML.choices[0]);
							arr.push(qXML.choices[1]);
							arr.push(qXML.choices[2]);
							arr.push(qXML.choices[3]);
							question.choices = arr;
							question.category = cat.name;
							
						}
						cat.questions = questions;
						
						cat.correctAnswers = 0;
						cat.wrongAnswers = 0;
						categories.push(cat);
					}
					
				}
					//new EventDispatcher().dispatchEvent(new Event(Event.COMPLETE));
				
			}
			catch (ev:TypeError)
			{
			}
			//return true;
		
		}
		
		//tracing the xml
		public function traceThis():void
		{
			
			for (var q:int = 0; q < categories.length; q++)
			{
				trace("-------------------------------------------------------------");
				trace("category[" + q + "]");
				trace("category name: " + categories[q].name);
				trace("correct answers: " + categories[q].correctAnswers);
				trace("wrong answers: " + categories[q].wrongAnswers);
				
				for (var x:int = 0; x < categories[q].questions.length > 0; x++)
				{
					var qu:Question = categories[q].questions[x];
					trace("question[" + x + "]:----");
					trace("name:" + qu.question);
					trace("answer:" + qu.answer);
					trace("choices:" + qu.choices[0]);
					trace("        " + qu.choices[1]);
					trace("        " + qu.choices[2]);
					trace("        " + qu.choices[3]);
				}
				
			}
		}
	
	}

}