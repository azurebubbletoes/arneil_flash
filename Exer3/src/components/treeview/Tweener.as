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
		private var myObj:Object; //object
		//var myDestX;  //destinationX
		private var myDestY:Number; //destinationY
		private var mySpeed:Number; //easing Speed
		private var myAlphaAmt:Number; //the amount to add or subtract alpha
		
		function Tweener()
		{
			myObj = null;
			//myDestX = 0;
			myDestY = 0;
			mySpeed = 1;
			myAlphaAmt = .01;
		}
		
		//***************************************************
		public function moveTween(object:Object, destinationY:Number, easingSpeed:Number):void
		{
			myObj = object;
			//myDestX = destinationX;
			myDestY = destinationY;
			mySpeed = easingSpeed;
			this.addEventListener(Event.ENTER_FRAME, moveTweener);
		}
		
		public function moveTweener(event:Event):void
		{
			if (myObj.y == myDestY)
			{
				this.removeEventListener(Event.ENTER_FRAME, moveTweener);
			}
			//myObj.x += (myDestX-myObj.x)/mySpeed;
			myObj.y += (myDestY - myObj.y) / mySpeed;
		
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