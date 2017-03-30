package com.idzeir.ui
{	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	/**
	 * ...
	 * @author: iDzeir
	 * @E-mail: qiyanlong@wozine.com
	 * @time: Mar 28, 2017 10:21:50 PM
	 *
	 **/
	
	public class Button extends MovieClip
	{
		private var _handler:Function;
		
		public function Button()
		{
			super();
			this.mouseChildren = false;
			this.buttonMode = true;
			
			addFrameScript(0,function():void
			{
				stop();
			});
			
			this.addEventListener(MouseEvent.CLICK,function(e:MouseEvent):void
			{
				if(_handler !== null)
				{
					_handler(e);
				}
			});
			
			this.addEventListener(MouseEvent.ROLL_OVER,function():void
			{
				gotoAndStop(2);
			});
			
			this.addEventListener(MouseEvent.ROLL_OUT,function():void
			{
				gotoAndStop(1);
			});
		}
		
		public function set handler(fun:Function):void
		{
			_handler = fun;
		}
	}
}