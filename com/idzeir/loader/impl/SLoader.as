package com.idzeir.loader.impl
{	
	import com.idzeir.loader.api.ISLoader;
	import com.idzeir.ui.api.IBox;
	
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	import flash.utils.Dictionary;
	
	
	/**
	 * ...
	 * @author: iDzeir
	 * @E-mail: qiyanlong@wozine.com
	 * @time: Mar 28, 2017 10:03:50 PM
	 *
	 **/
	
	public class SLoader implements ISLoader
	{
		private var _map:Vector.<loadOption> = new Vector.<loadOption>();
		
		private var _dic:Dictionary = new Dictionary(true);
		
		public function load(url:String, box:IBox):void
		{
			_map.push(new loadOption(url,box));
			
			run();
		}
		
		public function unload(child:DisplayObject):void
		{
			var loader:Loader = _dic[child];
			if(loader)
			{
				loader.unloadAndStop();
			}
		}
		
		public function run():void
		{
			var op:loadOption = _map.shift();
			$.i.append(op.url,op.parent);
			function okHandler(e:Event):void
			{
				try{
					var tar:DisplayObject = e.target.content as DisplayObject;
					if(tar)
					{
						op.parent.addChild(tar);
						_dic[tar] = _loader;
					}
				}catch(error:Error){
					$.i.append('show file error in',op.url,error.message);
				}
				clear();
			}
			
			function failHandler(e:Event):void
			{
				$.i.append('load error in file',op.url);
				clear();
			}
			
			function clear():void
			{
				_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,okHandler);
				_loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,failHandler);
			}
			
			var _loader:Loader = new Loader();
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE,okHandler);
			_loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,failHandler);
			_loader.load(new URLRequest(op.url));
		}
	}
}
import com.idzeir.ui.api.IBox;

class loadOption{
	public var url:String;
	public var parent:IBox;
	
	public function loadOption(url:String,parent:IBox)
	{
		this.url = url;
		this.parent = parent;
	}
}