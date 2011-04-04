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
	
	import flash.events.*;
	import flash.net.*;
	
	/**
	 * Used to interface with all methods of the Last.fm tasteometer web services.
	 */
	public class Tasteometer extends LastFMBase
	{
		public static const COMPARE:String = "compare";
		
		/**
		 * Get similar tags to the specified tag.
		 * @param type1 the first type of value to compare [user] | [artists] | [myspace].
		 * @param type2 the second type of value to compare [user] | [artists] | [myspace].
		 * @param value1 the first value to compare [Last.fm username] | [Comma-separated artist names] | [MySpace profile URL].
		 * @param value1 the second value to compare [Last.fm username] | [Comma-separated artist names] | [MySpace profile URL].
		 * @param limit the number of search results to be returned. Default is 5.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function compare(type1:String, type2:String, value1:String, value2:String, limit:uint = 5):void
		{
			requestURL("?method=tasteometer.compare&api_key=" + LastFMBase.API_KEY + "&type1=" + type1 + "&type2=" + type2 + "&value1=" + value1 + "&value2=" + value2 + "&limit=" + limit);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Tasteometer.COMPARE))});
		}
	}
}