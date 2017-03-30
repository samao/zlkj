package com.idzeir.loader.api
{
	import com.idzeir.ui.api.IBox;
	
	import flash.display.DisplayObject;
	
	/**
	 * ...
	 * @author: iDzeir
	 * @E-mail: qiyanlong@wozine.com
	 * @time: Mar 28, 2017 10:02:20 PM
	 *
	 **/
	
	public interface ISLoader
	{
		function load(url:String,box:IBox):void;
		
		function unload(child:DisplayObject):void
	}
}