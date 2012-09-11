package components.treeview
{
	import flash.display.Sprite;
	import components.treeview.TreeEvent;
	import flash.events.EventDispatcher;
	
	/**
	 * ...
	 * @author arneil mercado
	 */
	public class TreeViewComponent extends Sprite
	{
		private var _nodes:TreeNodeList; //root Node
		
		//private var _isUpdating:Boolean;
		
		//getters,setters, constructor
		// TODO: Like I've said many times, do not put the logic of loading the XML, or even parsing it, inside your TreeViewComponent.
		// What if I pass in a path to an XML which doesn't follow to your XML structure? Your tree view component will not work.
		// The data that should be passed here is the TreeViewData object which contains all the data it needs.
		
		public function TreeViewComponent()
		{
			_nodes = new TreeNodeList();
			
			//this._isUpdating = false;
		}
		
		public function beginUpdate():void
		{	
			//var e:TreeEvent = new TreeEvent(e.START_UPDATE, false, true);
			//this._isUpdating = true;
			//e.isUpdating = true;
			//dispatchEvent(e);
		
		}
		
		public function endUpdate():void
		{
			//var e:TreeEvent = new TreeEvent(e.END_UPDATE, false, true);
			//e.isUpdating = false;
			//this._isUpdating = false;
			//dispatchEvent(e);
		}
		
		public function get nodes():TreeNodeList 
		{
			return _nodes;
		}
		
		public function set nodes(value:TreeNodeList):void 
		{
			_nodes = value;
		}
	
		// TODO: You're inheriting from Sprite which means your class already has x and y properties.
		// This will create a conflict!
	
	}

}