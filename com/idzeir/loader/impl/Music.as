/**
 * ===================================
 * Author:	iDzeir					
 * Email:	qiyanlong@wozine.com	
 * Company:	http://www.acfun.tv		
 * Created:	Mar 29, 2017 10:31:54 AM
 * ===================================
 */

package com.idzeir.loader.impl
{
	import com.idzeir.loader.api.IMusic;
	
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.utils.Dictionary;
	
	public class Music implements IMusic
	{
		private var _map:Dictionary = new Dictionary(true);
		
		private var _sound:Sound;
		
		public function has(url:String):Boolean
		{
			return _map.hasOwnProperty(escape(url));
		}
		
		public function get(url:String):Sound
		{
			if(has(url)) return _map[escape(url)];
			return null;
		}
		
		public function set(url:String,sound:Sound):void
		{
			_map[escape(url)] = sound;
		}
		
		public function play(url:String):void
		{
			if(!has(url))
			{
				set(url,new Sound(new URLRequest(url)));
			}
			stop();
			_sound = get(url);
			_sound.play();
		}
		
		public function wrong():void
		{
			play('wrong.mp3');
		}
		
		public function right():void
		{
			play('right.mp3');
		}
		
		public function stop():void
		{
			//_sound && _sound.close();
		}
	}
}