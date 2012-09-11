package
{
	import components.treeview.Container;
	import components.treeview.TreeNode;
	import components.treeview.TreeViewComponent;
	import flash.display.Sprite;
	import flash.events.Event;
	
	
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
			
			//var c:Container = new Container("arneil");
			//addChild(c);
			//var tree:TreeViewComponent = new TreeViewComponent();
			
			//addChild(tree);
			//tree.nodes.push(new TreeNode(tree,"id", "le name"));
			
			//tree.endUpdate();
			
			

		}
		
	}

}