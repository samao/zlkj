/**
 * ===================================
 * Author:	iDzeir					
 * Email:	qiyanlong@wozine.com	
 * Company:	http://www.acfun.tv		
 * Created:	Mar 29, 2017 10:30:35 AM
 * ===================================
 */

package com.idzeir.loader.api
{
	public interface IMusic
	{
		function play(url:String):void;
		
		function stop():void;
		
		function wrong():void;
		
		function right():void;
	}
}