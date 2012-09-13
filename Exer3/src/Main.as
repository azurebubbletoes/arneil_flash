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
			trace("asd");
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
			tree.nodes.push(new TreeNode(tree, "one", "one"));
			tree.nodes.push(new TreeNode(tree, "two", "two"));
			tree.nodes.push(new TreeNode(tree, "two", "three"));
			tree.nodes.push(new TreeNode(tree, "two", "four"));
			tree.nodes.push(new TreeNode(tree, "two", "five"));
			tree.nodes.push(new TreeNode(tree, "two", "six"));
			tree.nodes.push(new TreeNode(tree, "two", "seven"));
			//tree.nodes.push(new TreeNode(tree, "id", "three"));
			//tree.nodes[0].nodes.push(new TreeNode(tree, "id", "one-one"));
			//tree.nodes[0].nodes.push(new TreeNode(tree, "id", "one-two"));
			var t:TreeNode = new TreeNode(tree, "id", "one-one");
			
			
			tree.nodes[0].nodes.push(t);
			tree.nodes[0].nodes.push(new TreeNode(tree, "id", "one-two"));
			tree.nodes[1].nodes.push(new TreeNode(tree, "id", "two-one"));
			tree.nodes[1].nodes.push(new TreeNode(tree, "id", "two-two"));
			tree.nodes[5].nodes.push(new TreeNode(tree, "id", "five"));
			tree.nodes[6].nodes.push(new TreeNode(tree, "id", "five"));
			tree.nodes[1].nodes[1].nodes.push(new TreeNode(tree, "id", "two-two-one"));
			
			//trace(tree.nodes[0].containsNode(t));
			
			tree.endUpdate();
			addChild(tree);
		
		}
	
	}

}