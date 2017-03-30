/**
 * ===================================
 * Author:	iDzeir					
 * Email:	qiyanlong@wozine.com	
 * Company:	http://www.acfun.tv		
 * Created:	Mar 29, 2017 10:55:03 AM
 * ===================================
 */

package com.idzeir.ui.game
{
	import com.idzeir.ui.Button;
	import com.idzeir.ui.Module;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	
	public class Findout extends Module
	{
		override protected function doing():void
		{
			super.doing();
			
			if(_status !== 0) return;
			_status = 1;
			var butMap:Vector.<Button> = new Vector.<Button>();
			for(var i:uint = 0; i < numChildren; ++i)
			{
				var but:Button = getChildAt(i) as Button;
				if(but)
				{
					if(but.name === "bgBut"){
						but.handler = function():void
						{
							$.s.wrong()
						};
						continue;
					}
					but.buttonMode = false;
					but.alpha = 0;
					butMap.push(but);
					but.handler = rightHandler;
				}
			}
			$.i.append('开始游戏',numChildren,butMap.length);
			function rightHandler(e:MouseEvent):void
			{
				var tar:Button = e.currentTarget as Button;
				if(tar && butMap.indexOf(tar) != -1)
				{
					tar.alpha = 1;
					butMap.splice(butMap.indexOf(tar),1);
					$.s.right();
					if(butMap.length === 0)
					{
						play();
					}
				}
			}
		}
	}
}