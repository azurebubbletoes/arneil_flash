package
{
	import components.treeview.Button;
	import components.treeview.TreeNode;
	import components.treeview.TreeViewComponent;
	import components.treeview.TreeEvent;
	import flash.text.StaticText;

	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.text.TextFormat;
	import flash.text.TextField;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.MovieClip;
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
				
			
			  
			   tree.nodes.push(new TreeNode(tree, "one", "one"));
			   
			
			   tree.nodes[0].nodes.push(new TreeNode(tree, "one", "one-one"));
			   tree.nodes[0].nodes[0].nodes.push(new TreeNode(tree, "one", "one-one-one"));
			   tree.nodes[0].nodes[0].nodes.push(new TreeNode(tree, "one", "one-one-twos"));
			   tree.nodes[0].nodes.push(new TreeNode(tree, "one", "one-two"));
			   tree.nodes[0].nodes[1].nodes.push(new TreeNode(tree, "one", "one-two-one"));
			   
			   
			   tree.nodes.push(new TreeNode(tree, "one", "two"));
			   tree.nodes[1].nodes.push(new TreeNode(tree, "one", "two-one"));
			   tree.nodes[1].nodes.push(new TreeNode(tree, "one", "two-two"));
			  
			   tree.endUpdate();
			   addChild(tree);
			   
			  
			   
		}
		
	
	
	}

}