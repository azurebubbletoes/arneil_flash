package  
{
	/**
	 * ...
	 * @author arneil mercado
	 */
	public class Hero 
	{
		
		private var _name:String;
		private var _level:int;
		private var _spells:Spell;
		private var _type:String;
		private var _id:int;	
		
		public function Hero() 
		{
			
		}
		
		public function get name():String 
		{
			return _name;
		}
		
		public function set name(value:String):void 
		{
			_name = value;
		}
		
		public function get level():int 
		{
			return _level;
		}
		
		public function set level(value:int):void 
		{
			_level = value;
		}
		
		public function get spells():Spell 
		{
			return _spells;
		}
		
		public function set spells(value:Spell):void 
		{
			_spells = value;
		}
		
		public function get type():String 
		{
			return _type;
		}
		
		public function set type(value:String):void 
		{
			_type = value;
		}
		
		public function get id():int 
		{
			return _id;
		}
		
		public function set id(value:int):void 
		{
			_id = value;
		}
		
	}

}