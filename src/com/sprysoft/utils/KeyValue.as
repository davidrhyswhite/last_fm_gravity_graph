package com.sprysoft.utils
{
	/**
	 * @private 
	 */
	public class KeyValue
	{
		public var key:String;
		public var value:*;
		/*
			var vars:Array = new Array();
			vars.push(new KeyValue("ab", "test"));
			vars.push(new KeyValue("cd", 4));
			vars.push(new KeyValue("eg", "test3"));
			vars.push(new KeyValue("aab", "test5"));
			vars.push(new KeyValue("at", "test6"));
			vars.sortOn("key", Array.CASEINSENSITIVE);
			trace(vars); // vars.toString 
		 */
		public function KeyValue(key:String, value:*)
		{
			this.key = key;
			this.value = value;
		}
		public function toString():String
		{
			return this.key + this.value;
		}
	}
}