package
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author arneil mercado
	 */
	public class TreeNode
	{
		private const ROOT_NODE:String = "0";
		
		private var _title:String;
		private var _id:String;
		private var _nodeName:String;
		private var _superNode:TreeNode;
		private var _nodeData:Array;
		private var _loader:URLLoader;
		//public function TreeNode(id:String, nodename:String, superNodeID:String,SuperNodeName:String)
		public function TreeNode(nodename:String, superNode:TreeNode = null)
		{
			//this.id = id;
			this.superNode = superNode;
			//this.title = title;
			this.nodeName = nodename;
		
		}
		
		public function get superNode():TreeNode
		{
			return _superNode;
		}
		
		public function set superNode(value:TreeNode):void
		{
			_superNode = value;
		}
		
		public function get id():String
		{
			return _id;
		}
		
		public function set id(value:String):void
		{
			_id = value;
		}
		
		public function get title():String
		{
			return _title;
		}
		
		public function set title(value:String):void
		{
			_title = value;
		}
		
		public function get nodeName():String
		{
			return _nodeName;
		}
		
		public function set nodeName(value:String):void
		{
			_nodeName = value;
		}
		
		private function getNodes():Array
		{
			return this._nodeData;
		}
		
		public function LoadXML(e:Event):void
		{
			try
			{
				
				var xml:XML = new XML(e.target.data);
				//getSuperNode();
				xml = traverseNodes(xml);
				
			}
			catch (e:TypeError)
			{
				trace("Could not parse text into XML");
				trace(e.message);
				
			}
			_loader.removeEventListener(Event.COMPLETE, LoadXML);
		}
		
		//traversing through the xml file to get the exact node data;
		private function traverseNodes(xml:XML):XML
		{
			//trace(xml);
			var nodeStack:Array = getNodeHierarchy(this);
			var nodeData:Array = generateNodes(xml, nodeStack);
			return xml;
		}
		
		private function generateNodes(xml:XML, nodeStack:Array):Array
		{
			trace("generate nodes");
			var i:int = 0;
			var xmlData: XML = xml;
			var nodes:Array = new Array();
			
			
			//if (nodeStack.length > 0) {
			//	nodeName:TreeNode = nodeStack.pop() as TreeNode;
				
			//	nodes.push(generateNodes(xmlData, nodeStack));
			//}
			return nodes;
		}
		
		private function getNodeHierarchy(node:TreeNode):Array
		{
			trace("traverse node function called.");
			var nodeStack:Array = new Array(); //node hierarchy
			var current:TreeNode = node;
			while (current.superNode != null)
			{
				nodeStack.push(current._superNode);
				trace(current._nodeName);
				current = current.superNode;
				
			}
			trace("stacking completed..");
			return nodeStack;
		}
		
		public function loadNodes():void
		{
			var _path:String = "xml/test.xml";
			
			_loader= new URLLoader();
			_loader.dataFormat = "xml";
			_loader.addEventListener(Event.COMPLETE, LoadXML);
			_loader.load(new URLRequest(_path));
		}
	
	}

}