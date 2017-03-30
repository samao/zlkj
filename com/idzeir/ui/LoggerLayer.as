/**
 * ===================================
 * Author:	iDzeir					
 * Email:	qiyanlong@wozine.com	
 * Company:	http://www.acfun.tv		
 * Created:	Mar 29, 2017 4:10:16 PM
 * ===================================
 */

package com.idzeir.ui
{
	import com.idzeir.ui.api.Ilog;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	
	public class LoggerLayer extends Sprite implements Ilog
	{
		private var _logTxt:TextField;
		
		public function LoggerLayer()
		{
			mouseEnabled = false;
			
			_logTxt = new TextField();
			_logTxt.autoSize = "left";
			_logTxt.textColor = 0xFFFFFF;
			_logTxt.mouseEnabled = false;
			addChild(_logTxt);
			
			addEventListener(Event.ADDED_TO_STAGE,function onAdded():void
			{
				removeEventListener(Event.ADDED_TO_STAGE,onAdded);
				_logTxt.width = stage.stageWidth;
				_logTxt.height = stage.stageHeight;
				_close.x = stage.stageWidth - 2 * _close.width;
				_close.y = _close.height;
				
				graphics.beginFill(0,.5);
				graphics.drawRect(0,0,stage.stageWidth,stage.stageHeight);
				graphics.endFill();
			});
			
			var _close:Button = new Button();
			_close.graphics.beginFill(0xFFFFFF);
			_close.graphics.drawCircle(10,10,10);
			_close.graphics.endFill();
			_close.handler = function():void
			{
				hiden();
			}
			addChild(_close);
			var _closeText:TextField = new TextField();
			_closeText.autoSize = "left";
			_closeText.text = "关";
			_closeText.x = _close.width - _closeText.width >> 1;
			_closeText.y = _close.height - _closeText.height >> 1;
			_close.addChild(_closeText);
			append('日志初始化完成');
			hiden();
		}
		
		public function append(...value):void
		{
			_logTxt.appendText(new Date().toUTCString() + '   ==>   ' + value.join(' ') + '\n');
		}
		
		public function clear():void
		{
			_logTxt.text = "";
		}
		
		public function show():void
		{
			visible = true;
		}
		
		public function hiden():void
		{
			visible = false;
		}
		
		public function toggle():void
		{
			if(visible)
				hiden();
			else
				show();
		}
	}
}