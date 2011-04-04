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
	 * Used to interface with all methods of the Last.fm track web services.
	 */
	public class Track extends LastFMBase
	{
		public static const ADD_TAGS:String = "addTags";
		public static const BAN:String = "ban";
		public static const GET_INFO:String = "getInfo";
		public static const GET_SIMILAR:String = "getSimilar";
		public static const GET_TAGS:String = "getTags";
		public static const GET_TOP_FANS:String = "getTopFans";
		public static const GET_TOP_TAGS:String = "getTopTags";
		public static const LOVE:String = "love";
		public static const REMOVE_TAG:String = "removeTag";
		public static const SEARCH:String = "search";
		public static const SHARE:String = "share";
		

		/**
		 * Add tags to a specific track using the artist and track name.
		 * @param artist the name of the artist.
		 * @param track the name of the track.
		 * @param tags a comma delimited list of user supplied tags to add to the album. Last.fm web services allow a maximum of 10 (currently only 1 allowed).
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function addTags(artist:String, track:String, tags:String):void
		{
			var variables:Array = new Array();
			variables.push(new KeyValue("artist", artist));
			variables.push(new KeyValue("method", "track.addTags"));
			variables.push(new KeyValue("api_key", LastFMBase.API_KEY));
			variables.push(new KeyValue("sk", LastFMBase.sk));
			variables.push(new KeyValue("tags", tags));
			variables.push(new KeyValue("track", track));
			
			var urlVariables:URLVariables = new URLVariables();
			urlVariables['artist'] = artist;
			urlVariables['method'] = "track.addTags";
			urlVariables['api_key'] = LastFMBase.API_KEY;
			urlVariables['sk'] = LastFMBase.sk;
			urlVariables['tags'] = tags;
			urlVariables['track'] = track;
			urlVariables['api_sig'] = createAPI_Signature(variables);
			
			requestURL("", URLRequestMethod.POST, urlVariables);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Track.ADD_TAGS))});
		}
		
		/**
		 * Ban track from user's account.
		 * @param track the name of the track.
		 * @param artist the name of the artist.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function ban(artist:String = null, track:String = null):void
		{
			var variables:Array = new Array();
			variables.push(new KeyValue("artist", artist));
			variables.push(new KeyValue("method", "track.ban"));
			variables.push(new KeyValue("api_key", LastFMBase.API_KEY));
			variables.push(new KeyValue("sk", LastFMBase.sk));
			variables.push(new KeyValue("track", track));
			
			var urlVariables:URLVariables = new URLVariables();
			urlVariables['artist'] = artist;
			urlVariables['method'] = "track.ban";
			urlVariables['api_key'] = LastFMBase.API_KEY;
			urlVariables['sk'] = LastFMBase.sk;
			urlVariables['track'] = track;
			urlVariables['api_sig'] = createAPI_Signature(variables);
			
			requestURL("", URLRequestMethod.POST, urlVariables);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Track.BAN))});
		}
		
		/**
		 * Get the metadata for a specific track using the artist name, track name or musicbrainz id.
		 * @param artist the name of the artist.
		 * @param track the name of the track.
		 * @param mbid the musicbrainz id of the artist.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function getInfo(artist:String = "", track:String = "", mbid:String = ""):void
		{
			requestURL("?method=track.getInfo&api_key=" + LastFMBase.API_KEY + "&artist=" + artist + "&track=" + track + "&mbid=" + mbid);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Track.GET_INFO))});
		}
		
		/**
		 * Get similar tracks using the artist name, track name or musicbrainz id.
		 * @param artist the name of the artist.
		 * @param track the name of the track.
		 * @param mbid the musicbrainz id of the artist.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function getSimilar(artist:String = "", track:String = "", mbid:String = ""):void
		{
			requestURL("?method=track.getSimilar&api_key=" + LastFMBase.API_KEY + "&artist=" + artist + "&track=" + track + "&mbid=" + mbid);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Track.GET_SIMILAR))});
		}
		
		/**
		 * Get tags applied to a track by a specific user.
		 * @param artist the name of the artist.
		 * @param track the name of the track.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function getTags(artist:String, track:String):void
		{
			var variables:Array = new Array();
			variables.push(new KeyValue("artist", artist));
			variables.push(new KeyValue("method", "track.getTags"));
			variables.push(new KeyValue("api_key", LastFMBase.API_KEY));
			variables.push(new KeyValue("sk", LastFMBase.sk));
			variables.push(new KeyValue("track", track));
			
			requestURL("?method=track.getTags&track=" + track + "&artist=" + artist + "&api_key=" + LastFMBase.API_KEY + "&api_sig=" + createAPI_Signature(variables) + "&sk=" + LastFMBase.sk);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Track.GET_TAGS))});
		}
		
		/**
		 * Get top fans for a track based on Last.fm listening data.
		 * @param artist the name of the artist.
		 * @param track the name of the track.
		 * @param mbid the musicbrainz id of the artist.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function getTopFans(artist:String = "", track:String = "", mbid:String = ""):void
		{
			requestURL("?method=track.getTopFans&api_key=" + LastFMBase.API_KEY + "&artist=" + artist + "&track=" + track + "&mbid=" + mbid);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Track.GET_TOP_FANS))});
		}
		
		/**
		 * Get top tags for a specific track, ordered by tag count.
		 * @param artist the name of the artist.
		 * @param track the name of the track.
		 * @param mbid the musicbrainz id of the artist.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function getTopTags(artist:String = "", track:String = "", mbid:String = ""):void
		{
			requestURL("?method=track.getTopTags&api_key=" + LastFMBase.API_KEY + "&artist=" + artist + "&track=" + track + "&mbid=" + mbid);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Track.GET_TOP_TAGS))});
		}
		
		/**
		 * Add track to loved tracks for a specific user.
		 * @param artist the name of the artist.
		 * @param track the name of the track.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function love(artist:String, track:String):void
		{
			var variables:Array = new Array();
			variables.push(new KeyValue("artist", artist));
			variables.push(new KeyValue("method", "track.love"));
			variables.push(new KeyValue("api_key", LastFMBase.API_KEY));
			variables.push(new KeyValue("sk", LastFMBase.sk));
			variables.push(new KeyValue("track", track));
			
			var urlVariables:URLVariables = new URLVariables();
			urlVariables['artist'] = artist;
			urlVariables['method'] = "track.love";
			urlVariables['api_key'] = LastFMBase.API_KEY;
			urlVariables['sk'] = LastFMBase.sk;
			urlVariables['track'] = track;
			urlVariables['api_sig'] = createAPI_Signature(variables);
			
			requestURL("", URLRequestMethod.POST, urlVariables);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Track.LOVE))});
		}
		
		/**
		 * Remove a tag from a specific track.
		 * @param artist the name of the artist.
		 * @param track the name of the track.
		 * @param tag the name of the tag to remove.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function removeTag(artist:String, track:String, tag:String):void
		{
			var variables:Array = new Array();
			variables.push(new KeyValue("artist", artist));
			variables.push(new KeyValue("method", "track.removeTag"));
			variables.push(new KeyValue("api_key", LastFMBase.API_KEY));
			variables.push(new KeyValue("sk", LastFMBase.sk));
			variables.push(new KeyValue("tag", tag));
			variables.push(new KeyValue("track", track));
			
			var urlVariables:URLVariables = new URLVariables();
			urlVariables['artist'] = artist;
			urlVariables['method'] = "track.removeTag";
			urlVariables['api_key'] = LastFMBase.API_KEY;
			urlVariables['sk'] = LastFMBase.sk;
			urlVariables['tag'] = tag;
			urlVariables['track'] = track;
			urlVariables['api_sig'] = createAPI_Signature(variables);
			
			requestURL("", URLRequestMethod.POST, urlVariables);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Track.REMOVE_TAG))});
		}
		
		/**
		 * Search for an track by the track name, ordered by relevance.
		 * @param track the name of the track.
		 * @param artist the name of the artist.
		 * @param limit the number of search results to be returned. Default (maximum) is 30.
		 * @param page the number of the results page to view. Default is 1.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function search(track:String, artist:String = "", limit:uint = 30, page:uint = 1):void
		{
			requestURL("?method=track.search&api_key=" + LastFMBase.API_KEY + "&artist=" + artist + "&track=" + track + "&limit=" + limit + "&page=" + page);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Track.SEARCH))});
		}
		
		/**
		 * Share a track with Last.fm users or other friends.
		 * @param artist the name of the artist.
		 * @param track the name of the track.
		 * @param recipient a comma delimited list of email addresses or Last.fm usernames. The Last.fm web services allow a maximum of 10 (currently only 1 allowed).
		 * @param message the message to send to the friends.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function share(artist:String, track:String, recipient:String, message:String = ""):void
		{
			var variables:Array = new Array();
			variables.push(new KeyValue("artist", artist));
			if(message != "") variables.push(new KeyValue("message", message));
			variables.push(new KeyValue("method", "track.share"));
			variables.push(new KeyValue("api_key", LastFMBase.API_KEY));
			variables.push(new KeyValue("recipient", recipient));
			variables.push(new KeyValue("sk", LastFMBase.sk));
			variables.push(new KeyValue("track", track));
			
			var urlVariables:URLVariables = new URLVariables();
			urlVariables['artist'] = artist;
			if(message != "") urlVariables['message'] = message;
			urlVariables['method'] = "track.share";
			urlVariables['api_key'] = LastFMBase.API_KEY;
			urlVariables['sk'] = LastFMBase.sk;
			urlVariables['recipient'] = recipient;
			urlVariables['track'] = track;
			urlVariables['api_sig'] = createAPI_Signature(variables);
			
			requestURL("", URLRequestMethod.POST, urlVariables);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Track.SHARE))});
		}
	}
}