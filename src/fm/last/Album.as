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
     * Used to interface with all methods of the Last.fm album web services.
     */
	public class Album extends LastFMBase
	{
		public static const ADD_TAGS:String = "addTags";
		public static const GET_INFO:String = "getInfo";
		public static const GET_TAGS:String = "getTags";
		public static const REMOVE_TAG:String = "removeTag";
		public static const SEARCH:String = "search";
		

		/**
		 * Add tags to a specific album.
		 * @param artist the name of the artist.
		 * @param album the name of the album.
		 * @param tags a comma delimited list of user supplied tags to add to the album. Last.fm web services allow a maximum of 10 (currently only 1 allowed).
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function addTags(artist:String, album:String, tags:String):void
		{
			var variables:Array = new Array();
			variables.push(new KeyValue("artist", artist));
			variables.push(new KeyValue("album", album));
			variables.push(new KeyValue("method", "album.addTags"));
			variables.push(new KeyValue("api_key", LastFMBase.API_KEY));
			variables.push(new KeyValue("sk", LastFMBase.sk));
			variables.push(new KeyValue("tags", tags));
			
			var urlVariables:URLVariables = new URLVariables();
			urlVariables['artist'] = artist;
			urlVariables['album'] = album;
			urlVariables['method'] = "album.addTags";
			urlVariables['api_key'] = LastFMBase.API_KEY;
			urlVariables['sk'] = LastFMBase.sk;
			urlVariables['tags'] = tags;
			urlVariables['api_sig'] = createAPI_Signature(variables);
			
			requestURL("", URLRequestMethod.POST, urlVariables);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Album.ADD_TAGS))});
		}

		/**
		 * Get the metadata for a specific album using all or a combination of the artist name, album name or musicbrainz id.
		 * @param artist the name of the artist.
		 * @param album the name of the album.
		 * @param mbid the musicbrainz id for the album.
		 * @param lang the language to return the biography in, expressed as an ISO 639 alpha-2 code.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function getInfo(artist:String = "", album:String = "", mbid:String = "", lang:String = ""):void
		{
			requestURL("?method=album.getInfo&api_key=" + LastFMBase.API_KEY + "&artist=" + artist + "&album=" + album + "&mbid=" + mbid + "&lang=" + lang);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Album.GET_INFO))});
		}
		
		/**
		 * Get the tags for a specific album using the artist name and album name.
		 * @param artist the name of the artist.
		 * @param album the name of the album.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function getTags(artist:String, album:String):void
		{
			var variables:Array = new Array();
			variables.push(new KeyValue("artist", artist));
			variables.push(new KeyValue("album", album));
			variables.push(new KeyValue("method", "album.getTags"));
			variables.push(new KeyValue("api_key", LastFMBase.API_KEY));
			variables.push(new KeyValue("sk", LastFMBase.sk));
			requestURL("?method=album.getTags&api_key=" + LastFMBase.API_KEY + "&artist=" + artist + "&album=" + album + "&api_sig=" + createAPI_Signature(variables) + "&sk=" + LastFMBase.sk);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Album.GET_TAGS))});
		}
		
		/**
		 * Remove a tag from a specific album.
		 * @param artist the name of the artist.
		 * @param album the name of the album.
		 * @param tag the name of the tag to remove.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function removeTag(artist:String, album:String, tag:String):void
		{
			var variables:Array = new Array();
			variables.push(new KeyValue("artist", artist));
			variables.push(new KeyValue("album", album));
			variables.push(new KeyValue("method", "album.removeTag"));
			variables.push(new KeyValue("api_key", LastFMBase.API_KEY));
			variables.push(new KeyValue("sk", LastFMBase.sk));
			variables.push(new KeyValue("tag", tag));
			
			var urlVariables:URLVariables = new URLVariables();
			urlVariables['artist'] = artist;
			urlVariables['album'] = album;
			urlVariables['method'] = "album.removeTag";
			urlVariables['api_key'] = LastFMBase.API_KEY;
			urlVariables['sk'] = LastFMBase.sk;
			urlVariables['tag'] = tag;
			urlVariables['api_sig'] = createAPI_Signature(variables);
			
			requestURL("", URLRequestMethod.POST, urlVariables);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Album.REMOVE_TAG))});
		}

		/**
		 * Search for an album by the album name.
		 * @param album the name of the album.
		 * @param limit the number of search results to be returned. Default (maximum) is 30.
		 * @param page the number of the results page to view. Default is 1.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function search(album:String, limit:uint = 30, page:uint = 1):void
		{
			requestURL("?method=album.search&api_key=" + LastFMBase.API_KEY + "&album=" + album + "&limit=" + limit + "&page=" + page);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Album.SEARCH))});
		}
	}
}