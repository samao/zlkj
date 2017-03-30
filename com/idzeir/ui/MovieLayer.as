package com.idzeir.ui
{	
	import com.idzeir.ui.api.IBox;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	
	/**
	 * ...
	 * @author: iDzeir
	 * @E-mail: qiyanlong@wozine.com
	 * @time: Mar 28, 2017 10:57:25 PM
	 *
	 **/
	
	public class MovieLayer extends Sprite implements IBox
	{
		public function MovieLayer()
		{
		}
		
		override public function addChild(child:DisplayObject):DisplayObject
		{
			$.r.warp.visible = true;
			clear();
			return super.addChild(child);
		}
		
		public function get warp():DisplayObject
		{
			return this;
		}
		
		public function show():void
		{
			visible = true;
		}
		
		public function hiden():void
		{
			visible = false;
		}
		
		public function clear():void
		{
			removeChildren();
		}
	}
}