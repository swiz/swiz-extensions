package org.swizframework.externalconfig.event
{
	import flash.events.Event;

	public class ConfigLoaderEvent extends Event
	{

		//--------------------------------------
		//   Static Properties 
		//--------------------------------------

		public static const CONFIG_LOAD_COMPLETE : String = "configLoadComplete";
		public static const CONFIG_LOAD_ERROR : String = "configLoadError";

		//--------------------------------------
		//   Constructor 
		//--------------------------------------

		public function ConfigLoaderEvent( type : String, configData : Object=null, error : String=null )
		{
			super( type, true, false );
			this.configData = configData;
			this.error = error;
		}


		//--------------------------------------
		//   Public Properties 
		//--------------------------------------

		public var configData : Object;
		public var error : String;

		//--------------------------------------
		//   Public Methods 
		//--------------------------------------

		override public function clone() : Event
		{
			return new ConfigLoaderEvent( type, configData, error );
		}

		override public function toString() : String
		{
			return formatToString( "ConfigLoaderEvent", "configData", "error" );
		}
	}
}
