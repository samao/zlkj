package com.idzeir.ui
{	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	/**
	 * ...
	 * @author: iDzeir
	 * @E-mail: qiyanlong@wozine.com
	 * @time: Mar 28, 2017 10:59:28 PM
	 *
	 **/
	
	public class Animate extends MovieClip
	{
		public function Animate()
		{
			super();
			
			this.addEventListener(Event.ENTER_FRAME,function():void
			{
				if(currentFrame === totalFrames)
				{
					$.i.append('animate end goto menu');
					removeEventListener(Event.ENTER_FRAME,arguments.callee);
					stop();
					$.r.show();
				}
			});
			
			addEventListener(Event.ADDED_TO_STAGE,function onAdded():void{
				removeEventListener(Event.ADDED_TO_STAGE,onAdded);
				graphics.beginFill(0xFFFFFF);
				graphics.drawRect(0,0,stage.stageWidth,stage.stageHeight);
				graphics.endFill();
			});
			
			addEventListener(Event.REMOVED_FROM_STAGE,function onRemoved():void
			{
				removeEventListener(Event.ADDED_TO_STAGE,onRemoved);
				unload();
			});
		}
		
		public function unload():void
		{
			graphics.clear();
			$.l.unload(this);
		}
	}
}