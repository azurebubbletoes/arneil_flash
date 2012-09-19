package components.treeview
{
	import flash.events.Event;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author arneil mercado
	 */
	public class Tweener extends Sprite
	{
		private var _myObj:Object; //object
		//var myDestX;  //destinationX
		private var _myDestY:Number; //destinationY
		private var _mySpeed:Number; //easing Speed
		private var _myAlphaAmt:Number; //the amount to add or subtract alpha
		
		public function Tweener()
		{
			_myObj = null;
			//myDestX = 0;
			_myDestY = 0;
			_mySpeed = 1;
			_myAlphaAmt = .01;
		}
		
		//***************************************************
		public function moveTween(object:Object, destinationY:Number, easingSpeed:Number):void
		{
			_myObj = object;
			//myDestX = destinationX;
			_myDestY = destinationY;
			_mySpeed = easingSpeed;
			this.addEventListener(Event.ENTER_FRAME, moveTweener);
		}
		
		public function moveTweener(event:Event):void
		{
			if (_myObj.y == _myDestY)
			{
				this.removeEventListener(Event.ENTER_FRAME, moveTweener);
			}
			//myObj.x += (myDestX-myObj.x)/mySpeed;
			_myObj.y += (_myDestY - _myObj.y) / _mySpeed;
		
		}
		//***************************************************
	/*function fadeOutTween(object, alphaSubtractAmount)
	   {
	   myAlphaAmt = alphaSubtractAmount;
	   myObj = object;
	   this.addEventListener(Event.ENTER_FRAME, fadeOutTweener);
	   }
	   function fadeOutTweener(event:Event)
	   {
	   if(myObj.alpha == 0)
	   {
	   this.removeEventListener(Event.ENTER_FRAME, fadeOutTweener);
	   }
	   myObj.alpha -= myAlphaAmt;
	   }
	   //***************************************************
	   function fadeInTween(object, alphaAddAmount)
	   {
	   myAlphaAmt = alphaAddAmount;
	   myObj = object;
	   this.addEventListener(Event.ENTER_FRAME, fadeInTweener);
	   }
	   function fadeInTweener(event:Event)
	   {
	   if(myObj.alpha == 1)
	   {
	   this.removeEventListener(Event.ENTER_FRAME, fadeInTweener);
	   }
	   myObj.alpha += myAlphaAmt;
	 }*/
		 //***************************************************
	}

}