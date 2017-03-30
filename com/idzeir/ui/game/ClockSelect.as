/**
 * ===================================
 * Author:	iDzeir					
 * Email:	qiyanlong@wozine.com	
 * Company:	http://www.acfun.tv		
 * Created:	Mar 30, 2017 3:59:15 PM
 * ===================================
 */

package com.idzeir.ui.game
{
	import com.idzeir.ui.Button;
	import com.idzeir.ui.Module;
	
	import flash.events.MouseEvent;
	
	public class ClockSelect extends Module
	{
		private var _dragBut:Button;

		private var _tHourBut:Button;
		
		private var _step:uint = 0;
		
		override protected function doing():void
		{
			super.doing();
			if(_status !== 0) return;
			_status = 1;
			$.i.append('游戏开始',this);
			++_step;
			_dragBut = getChildByName('dHour_'+_step) as Button;
			if(_dragBut)
			{
				_dragBut.mouseEnabled = true;
				_dragBut.addEventListener(MouseEvent.MOUSE_DOWN,pressHandler);
			}
			_tHourBut = getChildByName('t_but_'+_step) as Button;
			_tHourBut.mouseEnabled = false;
		}
		
		protected function pressHandler(e:MouseEvent):void
		{
			stage.addEventListener(MouseEvent.MOUSE_MOVE,moveHandler)
			stage.addEventListener(MouseEvent.MOUSE_UP,releaseHandler);
		}
		
		protected function releaseHandler(evt:MouseEvent):void
		{
			stage.removeEventListener(MouseEvent.MOUSE_UP,releaseHandler);
			stage.removeEventListener(MouseEvent.MOUSE_MOVE,moveHandler);
			var dig:Number = Math.atan2(_tHourBut.y - _dragBut.y,_tHourBut.x -_dragBut.x) * 180/Math.PI;
			$.i.append('目标角度',dig.toFixed(),'当前角度',_dragBut.rotation);
			if(Math.abs(dig - _dragBut.rotation) <= 10){
				$.i.append('成功');
				_dragBut.mouseEnabled = false;
				play();
				$.s.right();
			}else{
				$.i.append('失败');
				$.s.wrong();
			}
		}
		protected function moveHandler(evt:MouseEvent):void
		{
			_dragBut.rotation = Math.atan2(mouseY - _dragBut.y,mouseX -_dragBut.x) * 180/Math.PI;
		}
	}
}