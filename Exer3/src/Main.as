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
			
			   tree.nodes.push(new TreeNode(tree, "one", "one")); //depth 0
			
			
			   tree.nodes[0].nodes.push(new TreeNode(tree, "one", "one-one")); //depth 1
			   tree.nodes[0].nodes[0].nodes.push(new TreeNode(tree, "one", "one-one-one")); //depth 2
			   tree.nodes[0].nodes[0].nodes.push(new TreeNode(tree, "one", "one-one-two")); //depth 2
			
			   tree.nodes[0].nodes[0].nodes[0].nodes.push(new TreeNode(tree, "one", "one-one-one-one")); //depth 2
			   tree.nodes[0].nodes[0].nodes[1].nodes.push(new TreeNode(tree, "one", "one-one-one-two")); //depth 2
			
			   tree.nodes[0].nodes.push(new TreeNode(tree, "one", "one-two")); //depth 1
			   tree.nodes[0].nodes[1].nodes.push(new TreeNode(tree, "one", "one-two-one")); //depth 2
			   tree.nodes[0].nodes[1].nodes.push(new TreeNode(tree, "one", "one-two-two")); //depth 2
			
			   tree.nodes[0].nodes.push(new TreeNode(tree, "one", "one-three"));
			   tree.nodes[0].nodes[2].nodes.push(new TreeNode(tree, "one", "one-three"));
			
			   tree.nodes.push(new TreeNode(tree, "one", "two")); //depth 1
			   tree.nodes[1].nodes.push(new TreeNode(tree, "one", "two-one")); //depth 2
			   tree.nodes[1].nodes.push(new TreeNode(tree, "one", "two-two")); //depth 2
			
			   tree.nodes.push(new TreeNode(tree, "one", "three")); //depth 0
			
			   tree.endUpdate();
			   addChild(tree);
			 
		/*	var ball:Sprite = new Sprite();
			ball.graphics.beginFill(0xFF0000);
			ball.graphics.drawCircle(300, 300, 10);
			addChild(ball);
			var myTween:GTween = new GTween(ball, 2, {x: 100, y: 100}, {swapValues: true});*/
		}
	
	}

}