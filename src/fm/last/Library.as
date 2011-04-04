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
     * Used to interface with all methods of the Last.fm library web services.
     */
	public class Library extends LastFMBase
	{
		public static const ADD_ALBUM:String = "addAlbum";
		public static const ADD_ARTIST:String = "addArtist";
		public static const ADD_TRACK:String = "addTrack";
		public static const GET_ALBUMS:String = "getAlbums";
		public static const GET_ARTISTS:String = "getArtists";
		public static const GET_TRACKS:String = "getTracks";
		
		/**
		 * Add an album to a user's library using the artist name and album name.
		 * @param artist the name of the artist.
		 * @param album the name of the artist.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function addAlbum(artist:String, album:String):void
		{
			var variables:Array = new Array();
			variables.push(new KeyValue("artist", artist));
			variables.push(new KeyValue("album", album));
			variables.push(new KeyValue("method", "library.addAlbum"));
			variables.push(new KeyValue("api_key", LastFMBase.API_KEY));
			variables.push(new KeyValue("sk", LastFMBase.sk));
			
			var urlVariables:URLVariables = new URLVariables();
			urlVariables['artist'] = artist;
			urlVariables['album'] = album;
			urlVariables['method'] = "library.addAlbum";
			urlVariables['api_key'] = LastFMBase.API_KEY;
			urlVariables['sk'] = LastFMBase.sk;
			urlVariables['api_sig'] = createAPI_Signature(variables);
			
			requestURL("", URLRequestMethod.POST, urlVariables);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Library.ADD_ALBUM))});
		}
		
		/**
		 * Add an artist to a user's library using the artist name.
		 * @param artist the name of the artist.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function addArtist(artist:String):void
		{
			var variables:Array = new Array();
			variables.push(new KeyValue("artist", artist));
			variables.push(new KeyValue("method", "library.addArtist"));
			variables.push(new KeyValue("api_key", LastFMBase.API_KEY));
			variables.push(new KeyValue("sk", LastFMBase.sk));
			
			var urlVariables:URLVariables = new URLVariables();
			urlVariables['artist'] = artist;
			urlVariables['method'] = "library.addArtist";
			urlVariables['api_key'] = LastFMBase.API_KEY;
			urlVariables['sk'] = LastFMBase.sk;
			urlVariables['api_sig'] = createAPI_Signature(variables);
			
			requestURL("", URLRequestMethod.POST, urlVariables);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Library.ADD_ARTIST))});
		}
		
		/**
		 * Add a track to a user's library using the artist name and track name.
		 * @param artist the name of the artist.
		 * @param track the name of the track.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function addTrack(artist:String, track:String):void
		{
			var variables:Array = new Array();
			variables.push(new KeyValue("artist", artist));
			variables.push(new KeyValue("track", track));
			variables.push(new KeyValue("method", "library.addArtist"));
			variables.push(new KeyValue("api_key", LastFMBase.API_KEY));
			variables.push(new KeyValue("sk", LastFMBase.sk));
			
			var urlVariables:URLVariables = new URLVariables();
			urlVariables['artist'] = artist;
			urlVariables['track'] = track;
			urlVariables['method'] = "library.addArtist";
			urlVariables['api_key'] = LastFMBase.API_KEY;
			urlVariables['sk'] = LastFMBase.sk;
			urlVariables['api_sig'] = createAPI_Signature(variables);
			
			requestURL("", URLRequestMethod.POST, urlVariables);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Library.ADD_TRACK))});
		}
		
		/**
		 * Get a list of albums in a user's library using the user's name.
		 * @param user the Last.fm username of the user.
		 * @param limit the number of search results to be returned. Default (maximum) is 50.
		 * @param page the number of the results page to view. Default is 1.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function getAlbums(user:String, limit:Number = 50, page:Number = 1):void
		{
			requestURL("?method=library.getAlbums&user=" + user + "&limit=" + limit + "&page=" + page + "&api_key=" + LastFMBase.API_KEY);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Library.GET_ALBUMS))});
		}
		
		/**
		 * Get a list of artists in a user's library using the user's name.
		 * @param user the Last.fm username of the user.
		 * @param limit the number of search results to be returned. Default (maximum) is 50.
		 * @param page the number of the results page to view. Default is 1.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function getArtists(user:String, limit:Number = 50, page:Number = 1):void
		{
			requestURL("?method=library.getArtists&user=" + user + "&limit=" + limit + "&page=" + page + "&api_key=" + LastFMBase.API_KEY);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Library.GET_ARTISTS))});
		}
		
		/**
		 * Get a list of tracks in a user's library using the user's name.
		 * @param user the Last.fm username of the user.
		 * @param limit the number of search results to be returned. Default (maximum) is 50.
		 * @param page the number of the results page to view. Default is 1.
		 * @example Example of method in use:  
		 * <listing version="3.0" > 
		 * 
		 * 
		 * </listing>
		 */
		public function getTracks(user:String, limit:Number = 50, page:Number = 1):void
		{
			requestURL("?method=library.getTracks&user=" + user + "&limit=" + limit + "&page=" + page + "&api_key=" + LastFMBase.API_KEY);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Library.GET_TRACKS))});
		}
	}
}