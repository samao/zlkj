package com.idzeir.ui
{	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	
	/**
	 * ...
	 * @author: iDzeir
	 * @E-mail: qiyanlong@wozine.com
	 * @time: Mar 28, 2017 10:30:18 PM
	 *
	 **/
	
	public class Menu extends MovieClip
	{
		public function Menu()
		{
			this.addEventListener(Event.ADDED_TO_STAGE,onAdded);
		}
		
		private function onAdded(e:Event):void
		{
			stop();
			
			for(var i:uint = 0;i < numChildren; i++)
			{
				var but:Button = this.getChildAt(i) as Button;
				if(but && but.name == "menuBut")
				{
					$.i.append('返回主页按钮监听');
					but.handler = function(e:MouseEvent):void
					{
						$.i.append('返回主页');
						$.b.clear();
						$.m.show();
						$.r.hiden();
						$.r.warp.visible = false;
					}
					continue;
				}
				if(but && but.name.indexOf("but") == 0)
				{
					but.handler = function(e:MouseEvent):void
					{
						$.b.clear();
						$.r.hiden();
						$.m.hiden();
						var tar:Button = e.currentTarget as Button;
						$.l.load('video'+tar.name.match(/\d+/)[0]+'.swf',$.b);
					};
				}
			}
		}
	}
}