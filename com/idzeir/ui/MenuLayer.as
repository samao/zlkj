/**
 * ===================================
 * Author:	iDzeir					
 * Email:	qiyanlong@wozine.com	
 * Company:	http://www.acfun.tv		
 * Created:	Mar 29, 2017 10:26:08 AM
 * ===================================
 */

package com.idzeir.ui
{
	import com.idzeir.ui.api.IBox;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	public class MenuLayer extends Sprite implements IBox
	{
		public function MenuLayer()
		{
			super();
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
			
		}
	}
}