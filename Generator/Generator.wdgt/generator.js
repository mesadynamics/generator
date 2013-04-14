// Copyright 2006-2013 Danny Espinoza

var gadgetString = "";

function generator_setup()
{
	if(GeneratorPlugin) {
		GeneratorPlugin.registerWidget("RegisterWidget", "0000-0000-0000-0000");
		GeneratorPlugin.initWidget("InitWidget");
		GeneratorPlugin.findWidget("UserWidgetFolder");
	}
	
	if(window.widget) {
		widget.onshow = generator_onshow;
		widget.onhide = generator_onhide;

		window.open = generator_open;
	}
	
	return 0;
}

function generator_dismiss()
{
	if(GeneratorPlugin)
		//widget.openURL('');
        widget.openApplication('com.apple.Dock');
        
	return 0;
}

function generator_track()
{
	if(GeneratorPlugin)
		GeneratorPlugin.track();
	
	return 0;
}

function generator_onshow()
{
	if(GeneratorPlugin)
		GeneratorPlugin.resume();
	
	return 0;
}

function generator_onhide()
{
	if(GeneratorPlugin)
		GeneratorPlugin.pause();
	
	return 0;
}

function generator_open(url, frame, style)
{
	widget.openURL(url);
	
	return 0;
}

function generator_wake()
{
	if(gadgetString != "") {
		elem = document.getElementById("gadget");
		elem.innerHTML = gadgetString;
		gadgetString = "";
	}
	
	return 0;
}

function generator_sleep()
{
	elem = document.getElementById("gadget");
	gadgetString = elem.innerHTML;
	elem.innerHTML = "";
	
	return 0;
}

function generator_msg(msg)
{
	elem = document.getElementById("gadget");
	if(elem)
		elem.title = msg;
	
	return 0;
}

function generator_inject(msg)
{
	gadgetString = msg;
	
	return 0;
}

