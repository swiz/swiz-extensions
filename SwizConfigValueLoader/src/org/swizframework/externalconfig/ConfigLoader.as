package org.swizframework.externalconfig
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.xml.XMLDocument;
	import mx.rpc.xml.SimpleXMLDecoder;
	import org.swizframework.externalconfig.event.ConfigLoaderEvent;

	[Event( name = "configLoadComplete", type = "org.swizframework.externalconfig.event.ConfigLoaderEvent" )]
	[Event( name = "configLoadComplete", type = "org.swizframework.externalconfig.event.ConfigLoaderEvent" )]
	public class ConfigLoader extends EventDispatcher
	{
		
		//--------------------------------------
		//   Static Properties 
		//--------------------------------------
		
		public static const BUILD_NUMBER : String = "1";
		public static const VERSION_NUMBER : String = "1.0.0";
		

		//--------------------------------------
		//   Constructor 
		//--------------------------------------

		public function ConfigLoader()
		{
			super();
		}


		//--------------------------------------
		//   Public Properties 
		//--------------------------------------

		[Bindable]
		public var configData : Object;

		[Bindable]
		public var isConfigLoaded : Boolean = false;

		private var _source : String;

		public function get source() : String
		{
			return _source;
		}

		public function set source( value : String ) : void
		{
			_source = value;
			loadConfig();
		}

		[Bindable]
		public var xml : XML;

		//--------------------------------------
		//   Protected Properties 
		//--------------------------------------

		protected var loader : URLLoader;


		//--------------------------------------
		//   Public Methods 
		//--------------------------------------

		public function loadConfig() : void
		{
			isConfigLoaded = false;
			loader = new URLLoader();
			loader.addEventListener( Event.COMPLETE, handleLoadingResult );
			loader.addEventListener( IOErrorEvent.IO_ERROR, handleLoadingError );
			loader.load( new URLRequest( _source ) );
		}

		//--------------------------------------
		//   Protected Methods 
		//--------------------------------------

		protected function dispatchLoaderEvent( event : Event ) : void
		{
			dispatchEvent( event );
		}

		protected function handleLoadingError( event : IOErrorEvent ) : void
		{
			var errorEvent : ConfigLoaderEvent = new ConfigLoaderEvent( ConfigLoaderEvent.CONFIG_LOAD_ERROR );
			errorEvent.error = IOErrorEvent( event ).toString();
			dispatchLoaderEvent( errorEvent );
		}

		protected function handleLoadingResult( event : Event ) : void
		{
			var result : XML = new XML( loader.data );
			xml = result;

			var decoder : SimpleXMLDecoder = new SimpleXMLDecoder( true );
			var data : Object = decoder.decodeXML( new XMLDocument( result.toXMLString() ) );
			configData = data;
			isConfigLoaded = true;

			var loadCompleteEvent : ConfigLoaderEvent = new ConfigLoaderEvent( ConfigLoaderEvent.CONFIG_LOAD_COMPLETE, configData );
			dispatchLoaderEvent( loadCompleteEvent );
		}
	}
}
