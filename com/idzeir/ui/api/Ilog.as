/**
 * ===================================
 * Author:	iDzeir					
 * Email:	qiyanlong@wozine.com	
 * Company:	http://www.acfun.tv		
 * Created:	Mar 29, 2017 4:08:48 PM
 * ===================================
 */

package com.idzeir.ui.api
{
	public interface Ilog
	{
		function clear():void;
		
		function show():void;
		
		function hiden():void;
		
		function append(...value):void;
		
		function toggle():void;
	}
}