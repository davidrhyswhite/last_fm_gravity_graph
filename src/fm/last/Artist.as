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
     * Used to interface with all methods of the Last.fm artist web services.
     */
	public class Artist extends LastFMBase
	{
		public static const ADD_TAGS:String = "addTags";
		public static const GET_EVENTS:String = "getEvents";
		public static const GET_INFO:String = "getInfo";
		public static const GET_SIMILAR:String = "getSimilar";
		public static const GET_TAGS:String = "getTags";
		public static const GET_TOP_ALBUMS:String = "getTopAlbums";
		public static const GET_TOP_FANS:String = "getTopFans";
		public static const GET_TOP_TAGS:String = "getTopTags";
		public static const GET_TOP_TRACKS:String = "getTopTracks";
		public static const REMOVE_TAG:String = "removeTag";
		public static const SEARCH:String = "search";
		public static const SHARE:String = "share";
		

		/**
		 * Add tags to a specific artist.
		 * @param artist the name of the artist.
		 * @param tags a comma delimited list of user supplied tags to add to the album. Last.fm web services allow a maximum of 10 (currently only 1 allowed).
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function addTags(artist:String, tags:String):void
		{
			var variables:Array = new Array();
			variables.push(new KeyValue("artist", artist));
			variables.push(new KeyValue("method", "artist.addTags"));
			variables.push(new KeyValue("api_key", LastFMBase.API_KEY));
			variables.push(new KeyValue("sk", LastFMBase.sk));
			variables.push(new KeyValue("tags", tags));
			
			var urlVariables:URLVariables = new URLVariables();
			urlVariables['artist'] = artist;
			urlVariables['method'] = "artist.addTags";
			urlVariables['api_key'] = LastFMBase.API_KEY;
			urlVariables['sk'] = LastFMBase.sk;
			urlVariables['tags'] = tags;
			urlVariables['api_sig'] = createAPI_Signature(variables);
			
			requestURL("", URLRequestMethod.POST, urlVariables);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Artist.ADD_TAGS))});
		}
		
		/**
		 * Get events for a specific artist.
		 * @param artist the name of the artist.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function getEvents(artist:String):void
		{
			requestURL("?method=artist.getEvents&artist=" + artist + "&api_key=" + LastFMBase.API_KEY);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Artist.GET_EVENTS))});
		}
		
		/**
		 * Get the metadata for a specific artist using the artist name or musicbrainz id.
		 * @param artist the name of the artist.
		 * @param mbid the musicbrainz id of the artist.
		 * @param lang the language to return the biography in, expressed as an ISO 639 alpha-2 code.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function getInfo(artist:String = "", mbid:String = "", lang:String = ""):void
		{
			requestURL("?method=artist.getInfo&artist=" + artist + "&mbid=" + mbid + "&lang=" + lang + "&api_key=" + LastFMBase.API_KEY);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Artist.GET_INFO))});
		}
		
		/**
		 * Get the similar artists to the specified artist.
		 * @param artist the name of the artist.
		 * @param limit the number of results to be returned. Default is 30.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function getSimilar(artist:String, limit:uint = 30):void
		{
			requestURL("?method=artist.getSimilar&artist=" + artist + "&limit=" + limit + "&api_key=" + LastFMBase.API_KEY);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Artist.GET_SIMILAR))});
		}
		
		/**
		 * Get the tags for a specific artist using the artist name.
		 * @param artist the name of the artist.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function getTags(artist:String):void
		{
			var variables:Array = new Array();
			variables.push(new KeyValue("artist", artist));
			variables.push(new KeyValue("method", "artist.getTags"));
			variables.push(new KeyValue("api_key", LastFMBase.API_KEY));
			variables.push(new KeyValue("sk", LastFMBase.sk));
			
			requestURL("?method=artist.getTags&artist=" + artist + "&api_key=" + LastFMBase.API_KEY + "&api_sig=" + createAPI_Signature(variables) + "&sk=" + LastFMBase.sk);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Artist.GET_TAGS))});
		}
		
		/**
		 * Get the top albums for a specific artist, ordered by popularity.
		 * @param artist the name of the artist.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function getTopAlbums(artist:String):void
		{
			requestURL("?method=artist.getTopAlbums&artist=" + artist + "&api_key=" + LastFMBase.API_KEY);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Artist.GET_TOP_ALBUMS))});
		}
		
		/**
		 * Get the top fans for a specific artist, based on listing data.
		 * @param artist the name of the artist.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function getTopFans(artist:String):void
		{
			requestURL("?method=artist.getTopFans&artist=" + artist + "&api_key=" + LastFMBase.API_KEY);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Artist.GET_TOP_FANS))});
		}
		
		/**
		 * Get the top tags for a specific artist, ordered by popularity.
		 * @param artist the name of the artist.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function getTopTags(artist:String):void
		{
			requestURL("?method=artist.getTopTags&artist=" + artist + "&api_key=" + LastFMBase.API_KEY);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Artist.GET_TOP_TAGS))});
		}
		
		/**
		 * Get the top tracks for a specific artist, ordered by popularity.
		 * @param artist the name of the artist.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function getTopTracks(artist:String):void
		{
			requestURL("?method=artist.getTopTracks&artist=" + artist + "&api_key=" + LastFMBase.API_KEY);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Artist.GET_TOP_TRACKS))});
		}
		
		/**
		 * Remove a tag from a specific artist.
		 * @param artist the name of the artist.
		 * @param tag the name of the tag to remove.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function removeTag(artist:String, tag:String):void
		{
			var variables:Array = new Array();
			variables.push(new KeyValue("artist", artist));
			variables.push(new KeyValue("method", "artist.removeTag"));
			variables.push(new KeyValue("api_key", LastFMBase.API_KEY));
			variables.push(new KeyValue("sk", LastFMBase.sk));
			variables.push(new KeyValue("tag", tag));
			
			var urlVariables:URLVariables = new URLVariables();
			urlVariables['artist'] = artist;
			urlVariables['method'] = "artist.removeTag";
			urlVariables['api_key'] = LastFMBase.API_KEY;
			urlVariables['sk'] = LastFMBase.sk;
			urlVariables['tag'] = tag;
			urlVariables['api_sig'] = createAPI_Signature(variables);
			
			requestURL("", URLRequestMethod.POST, urlVariables);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Artist.REMOVE_TAG))});
		}
		
		/**
		 * Search for an artist by the artist name.
		 * @param artist the name of the artist.
		 * @param limit the number of search results to be returned. Default (maximum) is 30.
		 * @param page the number of the results page to view. Default is 1.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function search(artist:String, limit:Number = 30, page:Number = 1):void
		{
			requestURL("?method=artist.search&artist=" + artist + "&limit=" + limit + "&page=" + page + "&api_key=" + LastFMBase.API_KEY);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Artist.SEARCH))});
		}
		
		/**
		 * Share an artist with Last.fm users or other friends.
		 * @param artist the name of the artist.
		 * @param recipient a comma delimited list of email addresses or Last.fm usernames. The Last.fm web services allow a maximum of 10 (currently only 1 allowed).
		 * @param message the message to send to the friends.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function share(artist:String, recipient:String, message:String = ""):void
		{
			var variables:Array = new Array();
			variables.push(new KeyValue("artist", artist));
			variables.push(new KeyValue("recipient", recipient));
			variables.push(new KeyValue("message", message));
			variables.push(new KeyValue("method", "artist.share"));
			variables.push(new KeyValue("api_key", LastFMBase.API_KEY));
			variables.push(new KeyValue("sk", LastFMBase.sk));
			
			var urlVariables:URLVariables = new URLVariables();
			urlVariables['artist'] = artist;
			urlVariables['recipient'] = recipient;
			urlVariables['message'] = message;
			urlVariables['method'] = "artist.share";
			urlVariables['api_key'] = LastFMBase.API_KEY;
			urlVariables['sk'] = LastFMBase.sk;
			urlVariables['api_sig'] = createAPI_Signature(variables);
			
			requestURL("", URLRequestMethod.POST, urlVariables);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Artist.SHARE))});
		}
	}
}