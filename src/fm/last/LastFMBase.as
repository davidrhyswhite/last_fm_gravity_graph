package fm.last
{
	import com.gsolo.encryption.MD5;
	
	import flash.events.*;
	import flash.net.*;
	
	/**
	* The LastFMBase class is the base class for all classes in this API.
	* LastFMBase holds all the repetative methods and constanants used throughout the API.
	*/
	
	public class LastFMBase extends EventDispatcher
	{
		public static const API_URL:String = "http://ws.audioscrobbler.com/2.0/";
		public static const API_KEY:String = "a0d8c475f5c0d611d646c3d6fb26e038";
		public static const SECRET:String = "4841fec00f256bb495354022d983f7ec";
		public static const TOKEN:String = "726a328f2f6c196dcab8fad2e78bac07";
		
		public static var api_sig:String;
		public static var sk:String = "e27ff1201bb042cb146f06c046709b9f";
		
		public var loader:URLLoader = new URLLoader();
		
		private var _user:String;
		private var _xml:XML;
		private var _variables:URLVariables;
		
		/**
		* Typical format of a simple multiline comment.
		* This text describes the requestURL() method, which is declared below.
		*
		* @return void.
		*
		*/
		public function requestURL(url:String, method:String = URLRequestMethod.GET, variables:Object = null):void
		{
			_variables = new URLVariables();

			var request:URLRequest = new URLRequest(API_URL + url);
			if(variables != null)
			{
				for (var i:* in variables)
				{
					_variables[i] = variables[i];
				}
				request.data = _variables;
				trace("vars");
			}
            request.method = method;
            configureListeners(loader);
            loader.load(request);
            trace(method + " Request : " + request.url + "\n" + "Variables : " + _variables);
		}
		/*
		 * This method needs cleeaning up and refactoring as it's clunky. 
		 *
		 */
		public function createAPI_Signature(variables:Array):String
		{
			variables.sortOn("key", Array.CASEINSENSITIVE);
			var string:String = variables.toString() + SECRET;
			var pattern:RegExp = /,/;  
			for (var i:uint = 0;i<10; i++) string = string.replace(pattern, "");
			trace(string);
			return MD5.encrypt(string);		
		}

        private function configureListeners(dispatcher:IEventDispatcher):void {
            dispatcher.addEventListener(Event.COMPLETE, completeHandler);
            dispatcher.addEventListener(Event.OPEN, openHandler);
            dispatcher.addEventListener(ProgressEvent.PROGRESS, progressHandler);
            dispatcher.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
            dispatcher.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
            dispatcher.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
        }

        private function completeHandler(event:Event):void 
        {
        	trace("completeHandler:" + event);
			_xml = new XML(event.target.data);
        }

        private function openHandler(event:Event):void 
        {
            trace("openHandler: " + event);
        }

        private function progressHandler(event:ProgressEvent):void 
        {
            trace("progressHandler loaded:" + event.bytesLoaded + " total: " + event.bytesTotal);
        }

        private function securityErrorHandler(event:SecurityErrorEvent):void 
        {
            trace("securityErrorHandler: " + event);
        }

        private function httpStatusHandler(event:HTTPStatusEvent):void 
        {
            trace("httpStatusHandler: " + event);
        }

        private function ioErrorHandler(event:IOErrorEvent):void 
        {
            trace("ioErrorHandler: " + event);
        }
        
        public function get xml():XML { return _xml; }
	}
}