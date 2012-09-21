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
				
			
			   
			   tree.nodes.push(new TreeNode(tree, "one1", "one")); //depth 0
			   tree.nodes[0].nodes.push(new TreeNode(tree, "one2", "one-one")); //depth 1
			    tree.nodes[0].nodes.push(new TreeNode(tree, "one2", "one-two")); //depth 1
				  tree.nodes[0].nodes[1].nodes.push(new TreeNode(tree, "one2", "one-two-one")); //depth 1
				  
				  
			   tree.nodes[0].nodes[0].nodes.push(new TreeNode(tree, "one", "one-two-one")); //depth 2
			   tree.nodes[0].nodes[0].nodes[0].nodes.push(new TreeNode(tree, "one", "one-two-one")); //depth 2
			   

			   tree.nodes.push(new TreeNode(tree, "one5", "two")); //depth 1
			   tree.nodes[1].nodes.push(new TreeNode(tree, "one223", "two-one")); //depth 2
			   tree.nodes[1].nodes.push(new TreeNode(tree, "one2345", "two-two")); //depth 2
			
			   tree.nodes.push(new TreeNode(tree, "one6", "three")); //depth 0
				tree.nodes[2].nodes.push(new TreeNode(tree, "one2e23", "three-one")); //depth 2
			   tree.nodes[2].nodes.push(new TreeNode(tree, "one2e345", "three-two")); //depth 2
			   
			   
			    tree.nodes[2].nodes[0].nodes.push(new TreeNode(tree, "on2e2e345", "three-2two")); //depth 2
			    tree.nodes[2].nodes[1].nodes.push(new TreeNode(tree, "one22e345", "three-t2wo")); //depth 2
			   
			   
			   tree.endUpdate();
			   addChild(tree);
			 

		}
	
	}

}