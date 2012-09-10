package
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.text.TextField;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.xml.XMLNode;
	
	/**
	 * ...
	 * @author arneil mercado
	 */
	public class TreeNodeList
	{
		private var nodes:Array;
		private var _path:String;
		
		public function TreeNodeList()
		{
			nodes = new Array();
		}
		
		public function addNode(nodename:String, supernode:TreeNode):TreeNode
		{
			trace("add node function called");
			var node:TreeNode = new TreeNode(nodename, supernode);
			nodes[nodes.length] = node;
			trace("current node length:" + nodes.length);
			return node;
		}
		
		public function renderNodes():void
		{
			for (var i:int = 0; i < nodes.length; i++)
			{
				//trace("@" + i)+": ";
				(nodes[i] as TreeNode).loadNodes();
			}
		}
		
		public function get path():String
		{
			return _path;
		}
		
		public function set path(value:String):void
		{
			_path = value;
		}
	
	}

}