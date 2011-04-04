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
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	
	/**
     * Used to interface with all methods of the Last.fm event web services.
     */
	public class Events extends LastFMBase
	{
		public static const ATTEND:String = "attend";
		public static const GET_INFO:String = "getInfo";
		public static const SHARE:String = "share";
		
		
		/**
		 * Set the users attendence for a specific event using hte event id.
		 * @param event the id of the event.
		 * @param status the attendance status (0=Attending, 1=Maybe attending, 2=Not attending). Default is attending.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function attend(event:Number, status:uint = 0):void
		{
			var variables:Array = new Array();
			variables.push(new KeyValue("event", event));
			variables.push(new KeyValue("status", status));
			variables.push(new KeyValue("method", "event.attend"));
			variables.push(new KeyValue("api_key", LastFMBase.API_KEY));
			variables.push(new KeyValue("sk", LastFMBase.sk));
			
			var urlVariables:URLVariables = new URLVariables();
			urlVariables['event'] = event;
			urlVariables['status'] = status;
			urlVariables['method'] = "event.attend";
			urlVariables['api_key'] = LastFMBase.API_KEY;
			urlVariables['sk'] = LastFMBase.sk;
			urlVariables['api_sig'] = createAPI_Signature(variables);
			
			requestURL("", URLRequestMethod.POST, urlVariables);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Events.ATTEND))});
		}
		
		/**
		 * Get the metadata for a specific event using hte event id.
		 * @param event the id of the event.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function getInfo(event:Number):void
		{
			requestURL("?method=event.getInfo&event=" + event + "&api_key=" + LastFMBase.API_KEY);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Events.GET_INFO))});
		}
		
		/**
		 * Share an event with Last.fm users or other friends.
		 * @param event the id of the event.
		 * @param recipient a comma delimited list of email addresses or Last.fm usernames. The Last.fm web services allow a maximum of 10 (currently only 1 allowed).
		 * @param message the message to send to the friends.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function share(event:Number, recipient:String, message:String):void
		{
			var variables:Array = new Array();
			variables.push(new KeyValue("event", event));
			variables.push(new KeyValue("recipient", recipient));
			variables.push(new KeyValue("message", message));
			variables.push(new KeyValue("method", "artist.share"));
			variables.push(new KeyValue("api_key", LastFMBase.API_KEY));
			variables.push(new KeyValue("sk", LastFMBase.sk));
			
			var urlVariables:URLVariables = new URLVariables();
			urlVariables['event'] = event;
			urlVariables['recipient'] = recipient;
			urlVariables['message'] = message;
			urlVariables['method'] = "artist.share";
			urlVariables['api_key'] = LastFMBase.API_KEY;
			urlVariables['sk'] = LastFMBase.sk;
			urlVariables['api_sig'] = createAPI_Signature(variables);
			
			requestURL("", URLRequestMethod.POST, urlVariables);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Events.SHARE))});
		}
	}
}