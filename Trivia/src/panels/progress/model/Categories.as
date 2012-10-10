package panels.progress.model
{
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.Event
	
	/**
	 * ...
	 * @author arneil mercado
	 */
	public class Categories
	{
		private var _categories:Array;
		
		public function Categories()
		{
			_categories = new Array();
		}
		
		public function get categories():Array
		{
			return _categories;
		}
		
		public function set categories(value:Array):void
		{
			_categories = value;
		}
		
		public function load():void
		{
			var loader:URLLoader = new URLLoader();
			loader.dataFormat = "xml";
			loader.addEventListener(Event.COMPLETE, HandleXML);
			loader.load(new URLRequest("xml/questions.xml"));
		}
		
		private function HandleXML(e:Event):void
		{
			
			try
			{
				var xml:XML = new XML(e.target.data);
				
				for (var i:int = 0; i < xml.category.length(); i++)
				{
					
					var xxml:XML = xml.category[i];
					categories.push(xxml.@name);
					
				}
				
			}
			catch (ev:TypeError)
			{
			}
			//return true;
		
		}
	
	}

}