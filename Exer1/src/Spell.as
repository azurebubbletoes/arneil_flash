package  
{
	/**
	 * ...
	 * @author arneil mercado
	 */
	public class Spell 
	{
		private var _name:String;
		private var _manacost:int;
		private var _attribute:String;
		private var _effect:int;
		
		public function Spell(name:String,mana:int,att:String,eff:int) 
		{
			this.name = name;
			this.manacost = mana;
			this.attribute = att;
			this.effect = eff;
		}
		
		public function get name():String 
		{
			return _name;
		}
		
		public function set name(value:String):void 
		{
			_name = value;
		}
		
		public function get manacost():int 
		{
			return _manacost;
		}
		
		public function set manacost(value:int):void 
		{
			_manacost = value;
		}
		
		public function get attribute():String 
		{
			return _attribute;
		}
		
		public function set attribute(value:String):void 
		{
			_attribute = value;
		}
		
		public function get effect():int 
		{
			return _effect;
		}
		
		public function set effect(value:int):void 
		{
			_effect = value;
		}
		
	}

}