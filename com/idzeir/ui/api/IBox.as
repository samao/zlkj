/**
 * ===================================
 * Author:	iDzeir					
 * Email:	qiyanlong@wozine.com	
 * Company:	http://www.acfun.tv		
 * Created:	Mar 29, 2017 10:15:38 AM
 * ===================================
 */

package com.idzeir.ui.api
{
	import flash.display.DisplayObject;

	public interface IBox
	{
		function addChild(child:DisplayObject):DisplayObject;
		
		function clear():void;
		
		function show():void;
		
		function hiden():void;
		
		function get warp():DisplayObject;
	}
}