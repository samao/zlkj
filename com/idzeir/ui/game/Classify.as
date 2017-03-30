/**
 * ===================================
 * Author:	iDzeir					
 * Email:	qiyanlong@wozine.com	
 * Company:	http://www.acfun.tv		
 * Created:	Mar 29, 2017 1:16:40 PM
 * ===================================
 */

package com.idzeir.ui.game
{
	import com.idzeir.ui.Button;
	import com.idzeir.ui.Module;
	
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.utils.Dictionary;
	import flash.utils.setTimeout;
	
	public class Classify extends Module
	{
		private var _cBox:DisplayObjectContainer;

		private var _rBox:DisplayObjectContainer;

		private var _circleMap:Array;

		private var _recMap:Array;
		
		override protected function doing():void
		{
			super.doing();
			
			if(_status !== 0) return;
			_status = 1;
			$.i.append("game start",this);
			
			_circleMap = [];
			_recMap = [];
			
			_cBox = getChildByName('b_c') as DisplayObjectContainer;
			_rBox = getChildByName('b_r') as DisplayObjectContainer;
			
			for(var i:uint = 0; i<numChildren; ++i)
			{
				var but:Button = getChildAt(i) as Button;
				if(but)
				{
					if(but.name.indexOf('c') > 0 || but.name.indexOf('r') > 0)
					{
						continue;
					}
					if(but.name.indexOf('c') == 0)
					{
						_circleMap.push(but);
					}
					if(but.name.indexOf('r') == 0)
					{
						_recMap.push(but);
					}
					but.mouseEnabled = true;
					but.addEventListener(MouseEvent.MOUSE_DOWN,onPressHandler);
				}
			}
		}
		
		protected function onPressHandler(e:MouseEvent):void
		{
			var but:Button = e.currentTarget as Button;
			var op:Point = new Point(but.x,but.y);
			if(but)
			{
				setChildIndex(but,numChildren - 1);
				but.startDrag();
				stage.addEventListener(MouseEvent.MOUSE_UP,function release(e:MouseEvent):void
				{
					but.stopDrag();
					stage.removeEventListener(MouseEvent.MOUSE_UP,release);
					if(but.hitTestObject(_cBox['box']) && _circleMap.indexOf(but) !== -1)
					{
						$.i.append('圆形对了');
						_circleMap.splice(_circleMap.indexOf(but),1);
						rightPut(but,_cBox)
					}else if(but.hitTestObject(_rBox['box']) && _recMap.indexOf(but) !== -1){
						$.i.append('方形对了');
						_recMap.splice(_recMap.indexOf(but),1);
						rightPut(but,_rBox)
					}else{
						$.i.append('fail');
						$.s.wrong();
						but.x = op.x;
						but.y = op.y;
					}
				});
			}
		}
		
		protected function rightPut(but:Button,box:DisplayObjectContainer):void
		{
			$.i.append('right',but,box);
			but.mouseEnabled = false;
			$.s.right();
			but.x = Math.random()*80 + 10;
			but.y = Math.random()*10;
			box['box'].addChild(but);
			$.i.append('对象个数',box['box'].numChildren)
			if(_recMap.length == 0 && _circleMap.length == 0)
			{
				$.i.append('游戏结束');
				play();
			}
		}
	}
}