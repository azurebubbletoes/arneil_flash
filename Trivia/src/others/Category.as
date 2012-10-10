package others
{
	
	/**
	 * ...
	 * @author arneil mercado
	 */
	public class Category
	{
		private var _name:String
		private var _questions:Vector.<Question>;
		private var _correctAnswers:int;
		private var _wrongAnswers:int;
		
		public function Category(name:String = null)
		{
			this.name = name;
			wrongAnswers = 0;
			correctAnswers = 0;
		}
		
		public function get name():String
		{
			return _name;
		}
		
		public function set name(value:String):void
		{
			_name = value;
		}
		
		public function get questions():Vector.<Question>
		{
			return _questions;
		}
		
		public function set questions(value:Vector.<Question>):void
		{
			_questions = value;
		}
		
		public function get correctAnswers():int
		{
			return _correctAnswers;
		}
		
		public function set correctAnswers(value:int):void
		{
			_correctAnswers = value;
		}
		
		public function get wrongAnswers():int
		{
			return _wrongAnswers;
		}
		
		public function set wrongAnswers(value:int):void
		{
			_wrongAnswers = value;
		}
		
		public function isDone():Boolean
		{
			var answered:Boolean = true;
			for (var i:int = 0; i < questions.length; i++)
			{
				answered = answered && questions[i].isAnswered;
			}
			return answered;
		}
		
		public function numberOfQuestions():int
		{
			return questions.length;
		}
	
	}

}