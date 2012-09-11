package components.treeview
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author arneil mercado
	 */
	public class TreeNode extends Sprite
	{
		private var _treeNodeList:TreeNodeList;
		private var _id:String;
		private var _name:String;
		
		public function TreeNode(id:String, name:String)
		{
			this._id = id;
			this._name = name;
		}
		
		public function clear():void
		{
			if (_treeNodeList)
			{
				//removeChild(_treeNodeList);
				_treeNodeList.clear();
			}
			removeChild(this);
		}
		
		public override function get name():String
		{
			return _name;
		}
		
		public override function set name(value:String):void
		{
			_name = value;
		}
		
		public function get id():String
		{
			return _id;
		}
		
		public function set id(value:String):void
		{
			_id = value;
		}
		
		private function draw():void
		{
		
		}
	
	}

}