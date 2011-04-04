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
	import flash.events.Event;
	
	/**
	 * Used to interface with all methods of the Last.fm tag web services.
	 */
	public class Tag extends LastFMBase
	{
		public static const GET_SIMILAR:String = "getSimilar";
		public static const GET_TOP_ALBUMS:String = "getTopAlbums";
		public static const GET_TOP_ARTISTS:String = "getTopArtists";
		public static const GET_TOP_TAGS:String = "getTopTags";
		public static const GET_TOP_TRACKS:String = "getTopTracks";
		public static const GET_WEEKLY_ARTIST_CHART:String = "getWeeklyArtistChart";
		public static const GET_WEEKLY_CHART_LIST:String = "getWeeklyChartList";
		public static const SEARCH:String = "search";
		
		/**
		 * Get similar tags to the specified tag.
		 * @param tag the name of the tag.
		 */
		public function getSimilar(tag:String):void
		{
			requestURL("?method=tag.getSimilar&api_key=" + LastFMBase.API_KEY + "&tag=" + tag);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Tag.GET_SIMILAR))});
		}
		
		/**
		 * Get top albums with this tag, ordered by tag count.
		 * @param tag the name of the tag.
		 */
		public function getTopAlbums(tag:String):void
		{
			requestURL("?method=tag.getTopAlbums&api_key=" + LastFMBase.API_KEY + "&tag=" + tag);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Tag.GET_TOP_ALBUMS))});
		}
		
		/**
		 * Get top artists with this tag, ordered by tag count.
		 * @param tag the name of the tag.
		 */
		public function getTopArtists(tag:String):void
		{
			requestURL("?method=tag.getTopArtists&api_key=" + LastFMBase.API_KEY + "&tag=" + tag);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Tag.GET_TOP_ARTISTS))});
		}
		
		/**
		 * Get top tags accross all of Last.fm, ordered by popularity.
		 */
		public function getTopTags():void
		{
			requestURL("?method=tag.getTopTags&api_key=" + LastFMBase.API_KEY);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Tag.GET_TOP_TAGS))});
		}
		
		/**
		 * Get top tracks with this tag, ordered by tag count.
		 * @param tag the name of the tag.
		 */
		public function getTopTracks(tag:String):void
		{
			requestURL("?method=tag.getTopTracks&api_key=" + LastFMBase.API_KEY + "&tag=" + tag);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Tag.GET_TOP_TRACKS))});
		}
		
		/**
		 * Get an artist chart for the specified tag and date range. If no date range is specified then the most recent is returned.
		 * @param tag the name of the tag.
		 * @param datefrom the date the chart should start from.
		 * @param dateto the date the chart should end on.
		 * @param limit the number of chart results to be returned. Default (maximum) is 50.
		 */
		public function getWeeklyArtistChart(tag:String, datefrom:Number = 0, dateto:Number = 0, limit:Number = 50):void
		{
			var datefromString:String;
			var datetoString:String;
			datefromString = (datefrom != 0) ? "&from=" + datefrom : "";
			datetoString = (dateto != 0) ? "&to=" + dateto : "";
			requestURL("?method=tag.getWeeklyArtistChart&api_key=" + LastFMBase.API_KEY + "&tag=" + tag + datefromString + datetoString + "&limit=" + limit);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Tag.GET_WEEKLY_ARTIST_CHART))});
		}
		
		/**
		 * Get the weekly chart list for a specific tag using the tag name. This information can then be used in the date ranges on the other group services.
		 * @param tag the name of the tag.
		 */	
		public function getWeeklyChartList(tag:String):void
		{
			requestURL("?method=tag.getWeeklyChartList&api_key=" + LastFMBase.API_KEY + "&tag=" + tag);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Tag.GET_WEEKLY_CHART_LIST))});
		}
		
		/**
		 * Search for an tag by the tag name.
		 * @param tag the name of the tag.
		 * @param limit the number of search results to be returned. Default (maximum) is 30.
		 * @param page the number of the results page to view. Default is 1.
		 */
		public function search(tag:String, limit:Number = 30, page:Number = 1):void
		{
			requestURL("?method=tag.search&api_key=" + LastFMBase.API_KEY + "&tag=" + tag);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Tag.SEARCH))});
		}
	}
}