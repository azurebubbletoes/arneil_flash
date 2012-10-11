package QuizApp.view.components.others
{
	
	/**
	 * ...
	 * @author arneil mercado
	 */
	public class Question
	{
		private static var MAX_CHOICES:int = 4;
		
		private var _question:String;
		private var _answer:String;
		private var _choices:Array;
		private var _isAnswered:Boolean;
		private var _category:String
		
		public function Question(que:String = null, ch:Array = null, ans:String = null)
		{
			answer = ans;
			choices = ch;
			isAnswered = false;
			question = que; // formatString(que);
		
		}
		
		public function get question():String
		{
			return _question;
		}
		
		public function set question(value:String):void
		{
			_question = value;
		}
		
		public function get answer():String
		{
			return _answer;
		}
		
		public function set answer(value:String):void
		{
			_answer = value;
		}
		
		public function get choices():Array
		{
			return _choices;
		}
		
		public function set choices(value:Array):void
		{
			_choices = value;
		}
		
		public function get isAnswered():Boolean
		{
			return _isAnswered;
		}
		
		public function set isAnswered(value:Boolean):void
		{
			_isAnswered = value;
		}
		
		public function get category():String
		{
			return _category;
		}
		
		public function set category(value:String):void
		{
			_category = value;
		}
	
	}

}