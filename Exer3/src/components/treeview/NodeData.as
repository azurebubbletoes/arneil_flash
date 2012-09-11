package components.treeview
{
	/**
	 * ...
	 * @author arneil mercado
	 */
	public class NodeData 
	{
		private var _id:String;
		private var _title:string;
		
		public function NodeData(id:int,title:String) {}
		
		public function get title():string 
		{
			return _title;
		}
		
		public function set title(value:string):void 
		{
			_title = value;
		}
		
		public function get id():String 
		{
			return _id;
		}
		
		public function set id(value:String):void 
		{
			_id = value;
		}
		
	}

}