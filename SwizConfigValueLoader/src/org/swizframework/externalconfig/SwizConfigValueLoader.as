package org.swizframework.externalconfig
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;

	public class SwizConfigValueLoader extends ConfigLoader
	{

		//--------------------------------------
		//   Constructor 
		//--------------------------------------

		public function SwizConfigValueLoader()
		{
			super();
		}


		//--------------------------------------
		//   Public Properties 
		//--------------------------------------

		[Dispatcher]
		public var dispatcher : IEventDispatcher;


		//--------------------------------------
		//   Public Methods 
		//--------------------------------------

		override protected function dispatchLoaderEvent( event : Event ) : void
		{
			dispatcher.dispatchEvent( event );
		}
	}
}
