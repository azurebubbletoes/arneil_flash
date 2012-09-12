package
{
	import components.treeview.Button;
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
			
			
			var tree:TreeViewComponent = new TreeViewComponent();
			
			
			//addChild(tree);
			tree.nodes.push(new TreeNode(tree, "id", "one"));
			tree.nodes.push(new TreeNode(tree, "id", "two"));
			tree.nodes.push(new TreeNode(tree,"id", "three"));
			tree.nodes[0].nodes.push(new TreeNode(tree, "id", "one-one"));
			tree.nodes[0].nodes.push(new TreeNode(tree, "id", "one-two"));
			tree.nodes[1].nodes.push(new TreeNode(tree, "id", "two-one"));
			tree.nodes[0].nodes[0].nodes.push(new TreeNode(tree, "id", "one-one-one"));
			tree.nodes[0].nodes[0].nodes[0].nodes.push(new TreeNode(tree, "id", "one one one one"));
			

			
			tree.endUpdate();
			addChild(tree);
			
			
		
		}
		
	}

}