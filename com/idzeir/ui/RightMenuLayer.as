/**
 * ===================================
 * Author:	iDzeir					
 * Email:	qiyanlong@wozine.com	
 * Company:	http://www.acfun.tv		
 * Created:	Mar 29, 2017 3:23:36 PM
 * ===================================
 */

package com.idzeir.ui
{
	import com.greensock.TweenMax;
	import com.greensock.TweenNano;
	import com.idzeir.ui.api.IBox;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class RightMenuLayer extends Sprite implements IBox
	{
		public function RightMenuLayer()
		{
			super();
			$.l.load('rightMenu.swf',this);
			hiden();
			addEventListener(Event.ADDED_TO_STAGE,function onAdded():void
			{
				removeEventListener(Event.ADDED_TO_STAGE,onAdded);
				stage.addEventListener(MouseEvent.MOUSE_MOVE,function(e:MouseEvent):void
				{
					if(e.stageX > stage.stageWidth - 10 && e.stageX < stage.stageWidth && alpha == 0)
					{
						show();
					}
				});
				
				graphics.beginFill(0,0);
				graphics.drawRect(stage.stageWidth - 434,0,434,stage.stageHeight);
				graphics.endFill();
			});
			
			addEventListener(MouseEvent.ROLL_OUT,function():void
			{
				if(alpha == 1) hiden();
			});
		}
		
		public function get warp():DisplayObject
		{
			return this;
		}
		
		public function show():void
		{
			if(TweenMax.isTweening(this) || alpha == 1) return;
			alpha = 1;
			TweenMax.fromTo(this,.5,{x:434},{x:0,onComplete:function():void{
				mouseChildren = true;
			}});
		}
		
		override public function set alpha(value:Number):void
		{
			super.alpha = value;
			if(value <= 0)
				x = 434;
		}
		
		public function hiden():void
		{
			if(TweenMax.isTweening(this)) return;
			mouseChildren = false;
			if(stage)
				TweenMax.to(this,.5,{x:434,onComplete:function():void{
					alpha = 0;
					$.i.append('完全关闭');
				}});
			else
				alpha = 0;
		}
		
		public function clear():void
		{
			
		}
	}
}