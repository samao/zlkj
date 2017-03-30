/**
 * ===================================
 * Author:	iDzeir					
 * Email:	qiyanlong@wozine.com	
 * Company:	http://www.acfun.tv		
 * Created:	Mar 30, 2017 2:47:14 PM
 * ===================================
 */

package com.idzeir.ui.game
{
	import com.idzeir.ui.Button;
	import com.idzeir.ui.Module;
	
	import flash.events.MouseEvent;
	
	public class Selector extends Module
	{
		private var _rMap:Array = [];
		
		override protected function doing():void
		{
			super.doing();
			if(_status !== 0) return;
			_status = 1;
			$.i.append('游戏开始',this);
			mouseChildren = true;
			
			for(var i:uint = 0;i<numChildren;++i)
			{
				var but:Button = this.getChildAt(i) as Button;
				if(but)
				{
					but.mouseEnabled = true;
					
					if(but.name.indexOf('right') === 0)
					{
						_rMap.push(but);
						but.handler = function(e:MouseEvent):void
						{
							var tar:Button = e.currentTarget as Button;
							if(tar)
							{
								_rMap.splice(_rMap.indexOf(tar),1);
							}
							$.s.right();
							if(_rMap.length === 0)
							{
								$.i.append('通关了');
								play();
								mouseChildren = false;
							}
						};
					}else if(but.name.indexOf('wrong') == 0){
						but.handler = function():void
						{
							$.s.wrong();
						}
					}
				}
			}
		}
		
	}
}