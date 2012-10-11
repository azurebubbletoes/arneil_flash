package QuizApp.view.panels.progress.model
{
	/**
	 * ...
	 * @author arneil mercado
	 */
	import org.puremvc.as3.multicore.interfaces.IProxy;
	import org.puremvc.as3.multicore.patterns.proxy.Proxy;
	import flash.events.Event;
	import QuizApp.view.panels.progress.view.ProgressView;
	import flash.display.Sprite;
	
	public class ProgressProxy extends Proxy implements IProxy
	{
		public static var NAME:String = "ProgressProxy";
		
		//private var vo:CategoriesData=data as CategoriesData;
		
		public function ProgressProxy()
		{
			super(NAME, new Categories());
		}
		
		private function get vo():Categories
		{
			return data as Categories;
		}
		
		public function load():void
		{
			vo.load();
		}
		
		public function getAllCategories():Array
		{
			return vo.categories;
		}
		
		public function length():Number
		{
			return vo.categories.length;
		}
		
		public function set categories(value:Array):void
		{
			vo.categories = value;
		}
	}

}