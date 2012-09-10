package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.xml.XMLNode;
	
	
	/**
	 * ...
	 * @author arneil mercado
	 */
	public class Main extends Sprite
	{
		
		public function Main():void
		{
			
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{

			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			//CreateDisplay();
			
			var tree:TreeNodeList = new TreeNodeList();
			
			
			var root:TreeNode=tree.addNode("test", null);
			var h1:TreeNode = tree.addNode("node", root);
			var h2:TreeNode=tree.addNode("node1", h1);
			tree.renderNodes();
			
		}
		
		
	
	}
}