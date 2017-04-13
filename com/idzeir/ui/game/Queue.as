/**
 * ===================================
 * Author:	iDzeir					
 * Email:	qiyanlong@wozine.com	
 * Company:	http://www.acfun.tv		
 * Created:	Mar 30, 2017 12:14:22 PM
 * ===================================
 */

package com.idzeir.ui.game
{
	import com.idzeir.ui.Button;
	import com.idzeir.ui.Module;
	
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.utils.Dictionary;
	import flash.utils.setTimeout;
	
	public class Queue extends Module
	{
		private var _compairMap:Dictionary = new Dictionary(true);
		
		private var _cMap:Array = [];
		private var _tMap:Array = [];
		
		private var _hidenMap:Array = [];
		
		public function Queue()
		{
			super();
		}
		
		override protected function doing():void
		{
			super.doing();
			$.i.append('游戏开始',this);
			if(_status !== 0) return;
			_status = 1;
			for(var i:uint = 0; i < numChildren; ++i)
			{
				var but:Button = this.getChildAt(i) as Button;
				if(but)
				{
					if(but.name.indexOf('b') === 0)
					{
						but.addEventListener(MouseEvent.MOUSE_DOWN,pressHandler);
						_cMap.push(but);
						_hidenMap.push(but);
					}
					if(but.name.indexOf("t_") === 0)
					{
						_tMap.push(but);
					}
				}
			}
		}
		
		protected function pressHandler(e:MouseEvent):void
		{
			var but:Button = e.currentTarget as Button;
			setChildIndex(but,numChildren - 1);
			var point:Point = new Point(but.x,but.y);
			but.startDrag();
			stage.addEventListener(MouseEvent.MOUSE_UP,function release():void
			{
				but.stopDrag();
				stage.removeEventListener(MouseEvent.MOUSE_UP,release);
				
				var right:Boolean = false;
				for each(var tBut:Button in _tMap)
				{
					if(but.hitTestObject(tBut) && tBut.name.indexOf(but.name) !== -1)
					{
						tBut.alpha = 1;
						tBut.visible = true;
						but.visible = false;
						right = true;
						_tMap.splice(_tMap.indexOf(tBut),1);
						break;
					}
				}
				if(right)
				{
					but.x = tBut.x;
					but.y = tBut.y;
					but.mouseEnabled = false;
					$.s.right();
					_cMap.splice(_cMap.indexOf(but),1);
					if(_cMap.length == 0)
					{
						setTimeout(function():void
						{
							play();
						},100);
					}
				}else{
					but.x = point.x;
					but.y = point.y;
					$.s.wrong();
				}
			});
		}
	}
}