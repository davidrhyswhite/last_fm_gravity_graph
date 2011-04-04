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
     * Used to interface with all methods of the Last.fm playlist web services.
     */
	public class Playlist extends LastFMBase
	{
		public static const ADD_TRACK:String = "addTrack";
		public static const CREATE:String = "create";
		public static const FETCH:String = "fetch";
		
		/**
		 * Add a track to a playlist using the artist name and track name and playlistID (the playlist id can be obtained using User.getPlaylists).
		 * @param playlistID the id of the playlist.
		 * @param artist the name of the artist.
		 * @param track the name of the track.
		 */
		public function addTrack(playlistID:Number, artist:String, track:String):void
		{
			var variables:Array = new Array();
			variables.push(new KeyValue("playlistID", playlistID));
			variables.push(new KeyValue("track", track));
			variables.push(new KeyValue("artist", artist));
			variables.push(new KeyValue("method", "playlist.addTrack"));
			variables.push(new KeyValue("api_key", LastFMBase.API_KEY));
			variables.push(new KeyValue("sk", LastFMBase.sk));
			
			var urlVariables:URLVariables = new URLVariables();
			urlVariables['playlistID'] = playlistID;
			urlVariables['track'] = track;
			urlVariables['artist'] = artist;
			urlVariables['method'] = "playlist.addTrack";
			urlVariables['api_key'] = LastFMBase.API_KEY;
			urlVariables['sk'] = LastFMBase.sk;
			urlVariables['api_sig'] = createAPI_Signature(variables);
			
			requestURL("", URLRequestMethod.POST, urlVariables);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Playlist.ADD_TRACK))});
		}
		
		/**
		 * Create a playlist on a user's account.
		 * @param title the title of the playlist.
		 * @param description the description of the playlist.
		 */
		public function create(title:String = "", description:String = ""):void
		{
			var variables:Array = new Array();
			variables.push(new KeyValue("title", title));
			variables.push(new KeyValue("description", description));
			variables.push(new KeyValue("method", "playlist.create"));
			variables.push(new KeyValue("api_key", LastFMBase.API_KEY));
			variables.push(new KeyValue("sk", LastFMBase.sk));
			
			var urlVariables:URLVariables = new URLVariables();
			urlVariables['title'] = title;
			urlVariables['description'] = description;
			urlVariables['method'] = "playlist.create";
			urlVariables['api_key'] = LastFMBase.API_KEY;
			urlVariables['sk'] = LastFMBase.sk;
			urlVariables['api_sig'] = createAPI_Signature(variables);
			
			requestURL("", URLRequestMethod.POST, urlVariables);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Playlist.CREATE))});
		}
		
		/**
		 * Get a playlist using the playlist url, returns a XSPF (XML Shareable Playlist Format) document.
		 * @param playlistURL the url of the playlist.
		 */
		public function fetch(playlistURL:String):void
		{
			requestURL("?method=playlist.fetch&api_key=" + LastFMBase.API_KEY + "&playlistURL=" + playlistURL);
			loader.addEventListener(Event.COMPLETE, function (event:Event):void {dispatchEvent(new Event(Playlist.FETCH))});
		}
	}
}