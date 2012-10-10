package panels.progress.view
{
	/**
	 * ...
	 * @author arneil mercado
	 */
	import com.gskinner.motion.GTween;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.DataEvent;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.setTimeout;
	import org.puremvc.as3.multicore.patterns.observer.Notification;
	import others.Category;
	import others.GlobalEvent;
	
	import org.puremvc.as3.multicore.interfaces.IMediator;
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;
	import org.puremvc.as3.multicore.interfaces.INotification;
	import panels.progress.model.ProgressProxy;
	import others.Button;
	import panels.CategoryPanel;
	import main.view.CategoryMediator;
	
	public class ProgressMediator extends Mediator implements IMediator
	{
		public static const NAME:String = 'ProgressMediator';
		
		private var view:ProgressView;
		private var _proxy:ProgressProxy;
		
		public function ProgressMediator(viewComponent:Object)
		{
			super(NAME, viewComponent);
		}
		
		override public function onRegister():void
		{
			view = new ProgressView();
			
			_proxy = facade.retrieveProxy(ProgressProxy.NAME) as ProgressProxy;
			//view.displayaddEventListener(ProgressView.COMBOBOX_CLICKED, handleClicked);
			
			viewComponent.addChild(view);
			sendNotification(ProgressView.INIT);
		
		}
		
		override public function listNotificationInterests():Array
		{
			return [ProgressView.COMBOBOX_CLICKED, ProgressView.INIT, ProgressView.COMBOBOX_CHOSEN, CategoryPanel.PROGRESS, CategoryPanel.DISABLE, CategoryPanel.ENABLE, CategoryPanel.NEXT];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			var name:String = notification.getName();
			var body:Object = notification.getBody();
			
			switch (name)
			{
				
				case ProgressView.INIT: 
					//_proxy.load();
					_proxy.load();
					
					view.addEventListener(ProgressView.COMBOBOX_CLICKED, handleClicked, false, 0, true);
					view.display.addEventListener(MouseEvent.CLICK, view.clickComboBox, false, 0, true);
					
					trace("vvvv")
					trace(_proxy.getAllCategories()[0])
					//sendNotification(ProgressView.COMBOBOX_CLICKED);
					break;
				case ProgressView.COMBOBOX_CLICKED: 
					trace("xvvvv")
					trace(_proxy.getAllCategories()[0])
					view.display.removeEventListener(MouseEvent.CLICK, view.clickComboBox, false);
					view.removeEventListener(ProgressView.COMBOBOX_CLICKED, handleClicked, false);
					var arr:Array = _proxy.getAllCategories();
					
					var x:Number = view.display.x + view.container.x;
					var y:Number = view.container.y + view.display.y + view.display.height
					
					for (var i:int = 0; i < arr.length; i++)
					{
						if (view.text != arr[i])
						{
							var btn:Button = new Button(arr[i], 280);
							btn.x = x;
							btn.y = y;
							y += 30;
							
							view.addChild(btn);
							btn.addEventListener(MouseEvent.CLICK, handleChosen, false, 0, true);
							
						}
					}
					view.display.addEventListener(MouseEvent.CLICK, handleChosen, false, 0, true);
					
					break;
				case ProgressView.COMBOBOX_CHOSEN:
					
					var b:Button = body as Button;
					
					var chosen:String = b.label;
					
					var len:int = _proxy.length();
					var xx:int = 0;
					
					while (xx < len)
					{
						
						if (view.numChildren > 1)
							view.removeChildAt(view.numChildren - 1);
						else
							break;
						xx++;
					}
					
					view.container.removeChild(view.display);
					view.display.removeEventListener(MouseEvent.CLICK, view.clickComboBox, false);
					view.display = new Button(chosen, 280);
					view.display.x = 20;
					view.display.y = 10;
					
					view.container.addChild(view.display);
					view.addEventListener(ProgressView.COMBOBOX_CLICKED, handleClicked, false, 0, true);
					view.display.addEventListener(MouseEvent.CLICK, view.clickComboBox, false, 0, true);
					
					break;
				case CategoryPanel.NEXT: 
					var str:String = body as String;
					
					if (str != "none")
					{
						view.container.removeChild(view.display);
						view.display.removeEventListener(MouseEvent.CLICK, view.clickComboBox, false);
						view.display = new Button(str, 280);
						view.display.x = 20;
						view.display.y = 10;
						
						view.container.addChild(view.display);
						
						view.addEventListener(ProgressView.COMBOBOX_CLICKED, handleClicked, false, 0, true);
						view.display.addEventListener(MouseEvent.CLICK, view.clickComboBox, false, 0, true);
						
							//var g:GlobalEvent= new GlobalEvent(CategoryMediator.PROGRESS_CATEGORY, true, true);
							//g.body = str;
						
							//(viewComponent as Stage).dispatchEvent(g);
					}
					break;
				case CategoryPanel.PROGRESS: 
					var cat:Category = body as Category;
					
					trace(cat.correctAnswers);
					view.percentage.text = cat.correctAnswers + "/" + "" + cat.numberOfQuestions();
					view.points.text = "Points: " + (Math.round(((100 / cat.numberOfQuestions()) * cat.correctAnswers) * 100) / 100) as String;
					
					var prog:Number = cat.correctAnswers / cat.numberOfQuestions();
					
					view.container.removeChild(view.progressBar);
					view.progressBar = null;
					view.progressBar = view.createContainer(260 * prog, 25, 0x00FF00);
					view.container.addChild(view.progressBar);
					view.progressBar.x = 20;
					view.progressBar.y = 560;
					
					break;
				
				case CategoryPanel.DISABLE: 
					view.display.removeEventListener(MouseEvent.CLICK, view.clickComboBox, false);
					
					break;
				case CategoryPanel.ENABLE: 
					view.addEventListener(ProgressView.COMBOBOX_CLICKED, handleClicked, false, 0, true);
					break;
			
			}
		}
		
		private function handleClicked(e:Event):void
		{
			sendNotification(ProgressView.COMBOBOX_CLICKED);
		}
		
		private function handleChosen(e:Event):void
		{
			
			var b:Button = e.currentTarget as Button;
			if (b.label != "Select Category")
			{
				var g:GlobalEvent = new GlobalEvent(CategoryMediator.LOAD_QUESTION, true, true);
				g.body = b.label;
				
				(viewComponent as Stage).dispatchEvent(g);
				
				g = new GlobalEvent(CategoryMediator.PROGRESS_CATEGORY, true, true);
				g.body = b.label;
				(viewComponent as Stage).dispatchEvent(g);
				
				sendNotification(ProgressView.COMBOBOX_CHOSEN, e.currentTarget);
			}
			else
			{
				var len:int = _proxy.length();
				var xx:int = 0;
				
				while (xx < len)
				{
					
					if (view.numChildren > 1)
						view.removeChildAt(view.numChildren - 1);
					else
						break;
					xx++;
				}
				
				view.container.removeChild(view.display);
				view.display.removeEventListener(MouseEvent.CLICK, view.clickComboBox, false);
				view.display = new Button("Select Category", 280);
				view.display.x = 20;
				view.display.y = 10;
				
				view.container.addChild(view.display);
				view.addEventListener(ProgressView.COMBOBOX_CLICKED, handleClicked, false, 0, true);
				view.display.addEventListener(MouseEvent.CLICK, view.clickComboBox, false, 0, true);
			}
		}
	
		//public 
	}

}