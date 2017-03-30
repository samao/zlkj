/**
 * ===================================
 * Author:	iDzeir					
 * Email:	qiyanlong@wozine.com	
 * Company:	http://www.acfun.tv		
 * Created:	Mar 29, 2017 10:52:56 AM
 * ===================================
 */

package com.idzeir.ui
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.setTimeout;
	
	public class Module extends MovieClip
	{
		protected var _status:uint = 0;
		
		public function Module()
		{
			addEventListener(Event.ADDED_TO_STAGE,onAdded)
			
			addEventListener(Event.REMOVED_FROM_STAGE,function onRemoved():void
			{
				removeEventListener(Event.ADDED_TO_STAGE,onRemoved);
				unload();
			});
			
			addFrameScript(this.totalFrames - 1,function():void{stop()});
		}
		
		protected function onAdded(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE,onAdded);
			addDoingHandler();
		}
		
		private function addDoingHandler():void
		{
			addEventListener(Event.ENTER_FRAME,enterHandler);
		}
		
		private function enterHandler(e:Event = null):void
		{
			if(currentFrameLabel && currentFrameLabel.indexOf("DOING") >= 0)
			{
				stop();
				setTimeout(doing,200);
			}else if(currentFrame === totalFrames)
			{
				removeEventListener(Event.ENTER_FRAME,enterHandler);
				stop();
				showMenu();
			}
		}
		
		override public function play():void
		{
			super.play();
			addDoingHandler();
			_status = 0;
		}
		
		protected function doing():void
		{
			removeEventListener(Event.ENTER_FRAME,enterHandler);
		}
		
		protected function unload():void
		{
			$.l.unload(this);
		}
		
		public function showMenu():void
		{
			$.r.show();
		}
	}
}