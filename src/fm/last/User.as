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
	public class User extends LastFMBase
	{
		public static const GET_EVENTS:String = "getEvents";
		public static const GET_FRIENDS:String = "getFriends";
		public static const GET_INFO:String = "getInfo";
		public static const GET_LOVED_TRACKS:String = "getLovedTracks";
		public static const GET_NEIGHBOURS:String = "getNeighbours";
		public static const GET_PAST_EVENTS:String = "getPastEvents";
		public static const GET_PLAYLISTS:String = "getPlaylists";
		public static const GET_RECENT_TRACKS:String = "getRecentTracks";
		public static const GET_RECOMMENDED_EVENTS:String = "getRecommendedEvents";
		public static const GET_TOP_ALBUMS:String = "getTopAlbums";
		public static const GET_TOP_ARTISTS:String = "getTopArtists";
		public static const GET_TOP_TAGS:String = "getTopTags";
		public static const GET_TOP_TRACKS:String = "getTopTracks";
		public static const GET_WEEKLY_ALBUM_CHART:String = "getWeeklyAlbumChart";
		public static const GET_WEEKLY_ARTIST_CHART:String = "getWeeklyArtistChart";
		public static const GET_WEEKLY_CHART_LIST:String = "getWeeklyChartList";
		public static const GET_WEEKLY_TRACK_CHART:String = "getWeeklyTrackChart";
		
		
		/**
		 * Get events that a user is attending using hte user's name.
		 * @param user the name of the user.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function getEvents(user:String):void
		{
			requestURL("?method=user.getEvents&api_key=" + LastFMBase.API_KEY + "&user=" + user);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(User.GET_EVENTS))});
		}
		
		/**
		 * Get a list of user's friends, and their recent tracks.
		 * @param user the name of the user.
		 * @param recentTracks whether or not to include friends recent tracks data. Default is false.
		 * @param limit the number of friends returned. Default is 30.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function getFriends(user:String, recentTracks:Boolean = false, limit:int = 30):void
		{
			var showtracks:String;
			if (recentTracks) showtracks = "&recenttracks=true";
			else showtracks = "";
			requestURL("?method=user.getFriends&api_key=" + LastFMBase.API_KEY + "&user=" + user + "&limit=" + limit + showtracks);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(User.GET_FRIENDS))});
		}
		
		/**
		 * Get a information about authenticated user.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function getInfo():void
		{
			var variables:Array = new Array();
			variables.push(new KeyValue("api_key", LastFMBase.API_KEY));
			variables.push(new KeyValue("sk", LastFMBase.sk));
			variables.push(new KeyValue("method", "user.getInfo"));
			
			requestURL("?method=user.getInfo&api_key=" + LastFMBase.API_KEY + "&api_sig=" + createAPI_Signature(variables) + "&sk=" + LastFMBase.sk);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(User.GET_INFO))});
		}
		
		/**
		 * Get the last 50 tracks loved by a user using hte username.
		 * @param user the name of the user.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function getLovedTracks(user:String):void
		{
			requestURL("?method=user.getLovedTracks&api_key=" + LastFMBase.API_KEY + "&user=" + user);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(User.GET_LOVED_TRACKS))});
		}
		
		/**
		 * Get a list of user's neighbours using the user's name.
		 * @param user the name of the user.
		 * @param limit the number of neighbours returned. Default is 30.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function getNeighbours(user:String, limit:int = 30):void
		{
			requestURL("?method=user.getNeighbours&api_key=" + LastFMBase.API_KEY + "&user=" + user + "&limit=" + limit);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(User.GET_NEIGHBOURS))});
		}
		
		/**
		 * Get a list of user's neighbours using the user's name.
		 * @param user the name of the user.
		 * @param page the number of the results page to view. Default is 1.
		 * @param limit the number of neighbours returned. Default is 30.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function getPastEvents(user:String, page:uint = 1, limit:uint = 30):void
		{
			requestURL("?method=user.getPastEvents&api_key=" + LastFMBase.API_KEY + "&user=" + user + "&page=" + page + "&limit=" + limit);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(User.GET_PAST_EVENTS))});
		}
		
		/**
		 * Get a list of user's playlists using the user's name.
		 * @param user the name of the user.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function getPlaylists(user:String):void
		{
			requestURL("?method=user.getPlaylists&api_key=" + LastFMBase.API_KEY + "&user=" + user);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(User.GET_PLAYLISTS))});
		}
		
		/**
		 * Get a list of user's recent tracks, displays if the latest track is currently playing.
		 * @param user the name of the user.
		 * @param limit the number of tracks returned. Default is 30.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function getRecentTracks(user:String, limit:uint = 30):void
		{
			requestURL("?method=user.getRecentTracks&api_key=" + LastFMBase.API_KEY + "&user=" + user + "&limit=" + limit);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(User.GET_RECENT_TRACKS))});
		}
		
		/**
		 * Get a list of user's recommended events based on their Last.fm listening data.
		 * @param user the name of the user.
		 * @param page the number of the results page to view. Default is 1.
		 * @param limit the number of events returned. Default is 30.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function getRecommendedEvents(user:String, page:uint = 1, limit:uint = 30):void
		{
			var variables:Array = new Array();
			variables.push(new KeyValue("api_key", LastFMBase.API_KEY));
			variables.push(new KeyValue("limit", limit.toString()));
			variables.push(new KeyValue("method", "user.getRecommendedEvents"));
			variables.push(new KeyValue("page", page.toString()));
			variables.push(new KeyValue("sk", LastFMBase.sk));
			
			requestURL("?method=user.getRecommendedEvents&api_key=" + LastFMBase.API_KEY + "&api_sig=" + createAPI_Signature(variables) + "&sk=" + LastFMBase.sk + "&page=" + page + "&limit=" + limit);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(User.GET_RECOMMENDED_EVENTS))});
			
		}
		
		/**
		 * Get a list of top albums listened to by a user.
		 * @param user the name of the user.
		 * @param period the period the data returned is based on. [overall] | [3month] | [6month] | [12month]. Default is overall.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function getTopAlbums(user:String, period:String = "overall"):void
		{
			requestURL("?method=user.getTopAlbums&api_key=" + LastFMBase.API_KEY + "&user=" + user + "&period=" + period);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(User.GET_TOP_ALBUMS))});
		}
		
		/**
		 * Get a list of top artists listened to by a user.
		 * @param user the name of the user.
		 * @param period the period the data returned is based on. [overall] | [3month] | [6month] | [12month]. Default is overall.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function getTopArtists(user:String, period:String = "overall"):void
		{
			requestURL("?method=user.getTopArtists&api_key=" + LastFMBase.API_KEY + "&user=" + user + "&period=" + period);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(User.GET_TOP_ARTISTS))});
		}
		
		/**
		 * Get the top tags used by a specific user.
		 * @param user the name of the user.
		 * @param limit the number of tags returned. Default is 30.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function getTopTags(user:String, limit:uint = 30):void
		{
			requestURL("?method=user.getTopTags&api_key=" + LastFMBase.API_KEY + "&user=" + user + "&limit=" + limit);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(User.GET_TOP_TAGS))});
		}
		
		/**
		 * Get a list of top tracks listened to by a user.
		 * @param user the name of the user.
		 * @param period the period the data returned is based on. [overall] | [3month] | [6month] | [12month]. Default is overall.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function getTopTracks(user:String, period:String = "overall"):void
		{
			requestURL("?method=user.getTopTracks&api_key=" + LastFMBase.API_KEY + "&user=" + user + "&period=" + period);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(User.GET_TOP_TRACKS))});
		}
		
		/**
		 * Get the weekly album chart for a specific user using the user's name and date range. If no date range is specified then the most recent is returned.
		 * @param user the name of the user.
		 * @param datefrom the date the chart should start from.
		 * @param dateto the date the chart should end on.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function getWeeklyAlbumChart(user:String, datefrom:Number = 0, dateto:Number = 0):void
		{
			requestURL("?method=user.getWeeklyAlbumChart&api_key=" + LastFMBase.API_KEY + "&user=" + user + "&from=" + datefrom + "&to=" + dateto);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(User.GET_WEEKLY_ALBUM_CHART))});
		}
		
		/**
		 * Get the weekly artist chart for a specific user using the user's name and date range. If no date range is specified then the most recent is returned.
		 * @param user the name of the user.
		 * @param datefrom the date the chart should start from.
		 * @param dateto the date the chart should end on.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function getWeeklyArtistChart(user:String, datefrom:Number = 0, dateto:Number = 0):void
		{
			requestURL("?method=user.getWeeklyArtistChart&api_key=" + LastFMBase.API_KEY + "&user=" + user + "&from=" + datefrom + "&to=" + dateto);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(User.GET_WEEKLY_ARTIST_CHART))});
		}
		
		/**
		 * Get the weekly chart list for a specific user using the user's name. This information can then be used in the date ranges on the other user's services.
		 * @param group the name of the group.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */	
		public function getWeeklyChartList(user:String):void
		{
			requestURL("?method=user.getWeeklyChartList&api_key=" + LastFMBase.API_KEY + "&user=" + user);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(User.GET_WEEKLY_CHART_LIST))});
		}
		
		/**
		 * Get the weekly track chart for a specific user using the user's name and date range. If no date range is specified then the most recent is returned.
		 * @param user the name of the user.
		 * @param datefrom the date the chart should start from.
		 * @param dateto the date the chart should end on.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function getWeeklyTrackChart(user:String, datefrom:Number = 0, dateto:Number = 0):void
		{
			requestURL("?method=user.getWeeklyTrackChart&api_key=" + LastFMBase.API_KEY + "&user=" + user + "&from=" + datefrom + "&to=" + dateto);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(User.GET_WEEKLY_TRACK_CHART))});
		}
	}
}