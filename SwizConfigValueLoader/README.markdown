# Swiz Config Value Loader

The `SwizConfigValueLoader` is a class that you can define in a `BeanProvider` to pass external values into other beans.

For example, given an XML file like this:

	<config>
		<value1>This is value 1.</value1>
		<value2>This is value 2.</value2>
	</config>

You can declare something like this in a BeanProvider:

	<externalconfig:SwizConfigValueLoader id="configLoader" source="config.xml" />
	<controller:MyController id="myController"
	                         value1="{configLoader.configData.config.value1}" 
	                         value2="{configLoader.configData.config.value2}" />

and have the specified values from the external XML file set into the other bean(s).

Injection works the same way as with any other bean, meaning this would work:

	[Inject]
	public var configLoader : SwizConfigValueLoader;

And lastly, you can also set up EventHandler metadata in your beans to be notified via an event once the external data 
is loaded. (Don't forget to add "org.swizframework.externalconfig.event" to your eventPackages in your SwizConfig!)

	[EventHandler( event = "ConfigLoaderEvent.CONFIG_LOAD_COMPLETE", properties = "configData" )]
	public function onConfigLoadComplete( configData : Object ) : void
	{
		// You can now reference the value with syntax such as: 
		// configData.config.value1, configData.config.value2, etc.
	}

