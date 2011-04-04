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
	import flash.net.URLRequestMethod;
	
	/**
     * Used to interface with all methods of the Last.fm group web services.
     */
	public class Group extends LastFMBase
	{
		public static const WEEKLY_ALBUM_CHART:String = "weeklyAlbumChart";
		public static const WEEKLY_ARTIST_CHART:String = "weeklyArtistChart";
		public static const WEEKLY_CHART_LIST:String = "weeklyChartList";
		public static const WEEKLY_TRACK_CHART:String = "weeklyTrackChart";
		
		
		/**
		 * Get the weekly album chart for a specific group using the group name and date range. If no date range is specified then the most recent is returned.
		 * @param group the name of the group.
		 * @param datefrom the date the chart should start from.
		 * @param dateto the date the chart should end on.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function getWeeklyAlbumChart(group:String, datefrom:Number = 0, dateto:Number = 0):void
		{
			var datefromString:String;
			var datetoString:String;
			datefromString = (datefrom != 0) ? "&from=" + datefrom : "";
			datetoString = (dateto != 0) ? "&to=" + dateto : "";
			requestURL("?method=group.getWeeklyAlbumChart&group=" + group + datefromString + datetoString);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Group.WEEKLY_ALBUM_CHART))});
		}
		
		/**
		 * Get the weekly artist chart for a specific group using the group name and date range. If no date range is specified then the most recent is returned.
		 * @param group the name of the group.
		 * @param datefrom the date the chart should start from.
		 * @param dateto the date the chart should end on.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function getWeeklyArtistChart(group:String, datefrom:Number = 0, dateto:Number = 0):void
		{
			var datefromString:String;
			var datetoString:String;
			datefromString = (datefrom != 0) ? "&from=" + datefrom : "";
			datetoString = (dateto != 0) ? "&to=" + dateto : "";
			requestURL("?method=group.getWeeklyArtistChart&group=" + group + datefromString + datetoString);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Group.WEEKLY_ARTIST_CHART))});
		}
		
		/**
		 * Get the weekly chart list for a specific group using the group name. This information can then be used in the date ranges on the other group services.
		 * @param group the name of the group.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */	
		public function getWeeklyChartList(group:String):void
		{
			requestURL("?method=group.getWeeklyChartList&group=" + group, URLRequestMethod.GET);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Group.WEEKLY_CHART_LIST))});
		}
		
		/**
		 * Get the weekly track chart for a specific group using the group name and date range. If no date range is specified then the most recent is returned.
		 * @param group the name of the group.
		 * @param datefrom the date the chart should start from.
		 * @param dateto the date the chart should end on.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function getWeeklyTrackChart(group:String, datefrom:Number = 0, dateto:Number = 0):void
		{
			var datefromString:String;
			var datetoString:String;
			datefromString = (datefrom != 0) ? "&from=" + datefrom : "";
			datetoString = (dateto != 0) ? "&to=" + dateto : "";
			requestURL("?method=group.getWeeklyTrackChart&group=" + group + datefromString + datetoString);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Group.WEEKLY_TRACK_CHART))});
		}
	}
}