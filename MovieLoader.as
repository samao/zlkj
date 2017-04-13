package
{	
	import com.idzeir.loader.impl.Music;
	import com.idzeir.loader.impl.SLoader;
	import com.idzeir.ui.LoggerLayer;
	import com.idzeir.ui.MenuLayer;
	import com.idzeir.ui.MovieLayer;
	import com.idzeir.ui.RightMenuLayer;
	import com.idzeir.ui.api.IBox;
	import com.idzeir.ui.api.Ilog;
	
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.ContextMenuEvent;
	import flash.events.Event;
	import flash.ui.ContextMenu;
	import flash.ui.ContextMenuItem;
	
	
	/**
	 * ...
	 * @author: iDzeir
	 * @E-mail: qiyanlong@wozine.com
	 * @time: Mar 28, 2017 9:48:01 PM
	 *
	 **/
	
	public class MovieLoader extends Sprite
	{
		private var menuLayer:IBox;
		private var movieLayer:IBox;
		
		public function MovieLoader()
		{
			this.addEventListener(Event.ADDED_TO_STAGE,onAdded);
		}
		
		private function onAdded(e:Event):void
		{
			var logger:LoggerLayer = new LoggerLayer();
			$.i =  logger;
			$.l = new SLoader();
			$.s = new Music();
			$.m = menuLayer = addChild(new MenuLayer()) as IBox;
			$.b = movieLayer = addChild(new MovieLayer()) as IBox;
			$.r = addChild(new RightMenuLayer()) as IBox;
			
			addChild(logger)
			
			loadMenu();
			
			var _mask:Shape = new Shape();
			_mask.graphics.beginFill(0);
			_mask.graphics.drawRect(0,0,stage.stageWidth,stage.stageHeight);
			_mask.graphics.endFill();
			mask = _mask;
			addChild(_mask);
			
			contextMenu ||= new ContextMenu();
			contextMenu.hideBuiltInItems();
			var logItem:ContextMenuItem = new ContextMenuItem('LOG');
			contextMenu.customItems.push(logItem);
			logItem.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT,function():void
			{
				logger.toggle();
			});
		}
		
		private function loadMenu():void
		{
			$.l.load('menu.swf',menuLayer);
			//$.r.warp.visible = false;
		}
	}
}