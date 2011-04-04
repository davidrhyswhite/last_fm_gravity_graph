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
	 * Used to interface with all methods of the Last.fm user web services.
	 */
	public class Geo extends LastFMBase
	{
		public static const GET_EVENTS:String = "getEvents";
		public static const GET_TOP_ARTISTS:String = "getTopArtists";
		public static const GET_TOP_TRACKS:String = "getTopTracks";
		
		/**
		 * Get a list events based on location (city or country), if no location is specified a list of nearby events is returned.
		 * @param location the location of the events returned, use either a country or city name.
		 * @param lat the latitude of the events.
		 * @param long the longditude of the events.
		 * @param page the number of the results page to view. Default is 1.
		 * @param limit the number of friends returned. Default is 20.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
 		public function getEvents(location:String = "", lat:Number = 0, long:Number = 0, page:uint = 1, distance:Number = 20):void
		{
			var latString:String;
			var longString:String;
			latString = (lat != 0) ? "&lat=" + lat : "";
			longString = (long != 0) ? "&long=" + lat : "";
			requestURL("?method=geo.getEvents&api_key=" + LastFMBase.API_KEY + "&location=" + location + latString + longString + "&page=" + page + "&distance=" + distance);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Geo.GET_EVENTS))});
		}
		
		/**
		 * Get a list of the top artists based on country.
		 * @param country the name of the country as defined by the ISO 3166-1 country names standard.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
 		public function getTopArtists(country:String):void
		{
			requestURL("?method=geo.getTopArtists&api_key=" + LastFMBase.API_KEY + "&country=" + country);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Geo.GET_TOP_ARTISTS))});
		}
		
		/**
		 * Get a list of the top tracks based on country.
		 * @param country the name of the country as defined by the ISO 3166-1 country names standard.
		 * @param country a metro name, to fetch the charts for (must be within the country specified).
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
 		public function getTopTracks(country:String, location:String = ""):void
		{
			var locationString:String;
			locationString = (location != "") ? "&location=" + location : "";
			requestURL("?method=geo.getTopTracks&api_key=" + LastFMBase.API_KEY + "&country=" + country + locationString);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Geo.GET_TOP_TRACKS))});
		}
	}
}