/*
Copyright (c) 2008 David White

Permission is hereby granted, free of charge, to any person obtaining a copy of this 
software and associated documentation files (the "Software"), to deal in the Software 
without restriction, including without limitation the rights to use, copy, modify, 
merge, publish, distribute, sublicense, and/or sell copies of the Software, and to 
permit persons to whom the Software is furnished to do so, subject to the following 
conditions:

The above copyright notice and this permission notice shall be included in all copies 
or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A 
PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT 
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE 
OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

@ignore
*/
package fm.last
{
	import com.sprysoft.utils.KeyValue;
	
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.navigateToURL;
	
	/**
     * Used to request authentication methods from Last.fm web services.
     */
	public class Auth extends LastFMBase
	{
		public static const TOKEN_LOADED:String = "tokenLoaded";
		public static const SESSION_LOADED:String = "sessionLoaded";
		
		
		/**
		 * Get session key for authentication purposes.
		 */
		public function getSession():void
		{
			var variables:Array = new Array();
			variables.push(new KeyValue("api_key", LastFMBase.API_KEY));
			variables.push(new KeyValue("method", "auth.getSession"));
			variables.push(new KeyValue("token", LastFMBase.TOKEN));
			var url:String = "?method=auth.getSession&api_key=" + API_KEY+ "&api_sig=" + createAPI_Signature(variables) + "&token=" + TOKEN;
			requestURL(url, URLRequestMethod.GET);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Auth.SESSION_LOADED))});
		}
		
		/**
		 * Request token for authentication purposes. This services will redirect the browser to Last.fm for authentication of Last.fm user account.
		 */
		public function requestToken():void
		{
			var request:URLRequest = new URLRequest("http://www.last.fm/api/auth/?" + "api_key=" + LastFMBase.API_KEY);
			navigateToURL(request);
		}
	}
}