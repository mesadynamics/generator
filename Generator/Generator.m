//
//  Generator.m
//  Generator
//
//  Created by Danny Espinoza on 10/4/06.
//  Copyright 2006 Mesa Dynamics, LLC. All rights reserved.
//

#import "Generator.h"
#import "WebCoreJavaScript.h"

@implementation Generator

- (id)initWithWebView:(WebView *)webView
{
	self = [super init];

	parentWebView = nil;
	childWebView = nil;
	data = NULL;
	
	didFind = NO;
	didPause = NO;
	
	usingDashboard = NO;
	usingFlash = NO;
	allowBrowserSpawning = NO;
	launchInSafari = NO;
		
	parentWebView = [webView retain];
	[parentWebView setCustomUserAgent:@"Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/125.4 (KHTML, like Gecko) Safari/125.9"];
		
	widgetView = nil;
	widgetParentView = nil;

	dashboardWindow = nil;
	dashboardView = nil;
	
	NSFileManager* fm = [NSFileManager defaultManager];
	NSString* flashPath = [NSString stringWithFormat:@"%@/Library/Preferences/Macromedia/Flash Player/#Security/FlashPlayerTrust", NSHomeDirectory()];
	if([fm fileExistsAtPath:flashPath] == NO)
		[fm createDirectoryAtPath:flashPath attributes:nil];
	
	if([fm fileExistsAtPath:flashPath]) {
		NSBundle* securityBundle = [NSBundle bundleForClass:[self class]];
		NSString* securityPath = [[securityBundle bundlePath] stringByDeletingLastPathComponent];
		NSBundle* widgetBundle = [NSBundle bundleWithPath:securityPath];
		NSString* securityFile = [NSString stringWithFormat:@"%@/%@.cfg", flashPath, [widgetBundle bundleIdentifier]];
		
		if([fm fileExistsAtPath:securityFile] == NO) {
			NSString* securityString = [NSString stringWithFormat:@"%@\n", securityPath];
			[fm createFileAtPath:securityFile contents:[securityString dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
		}
	}
	
	return self;
}

- (void)windowScriptObjectAvailable:(WebScriptObject *)windowScriptObject
{
	[windowScriptObject setValue:self forKey:@"GeneratorPlugin"];

	id webCoreJavaScript = nil;
	if((webCoreJavaScript = NSClassFromString(@"WebCoreJavaScript"))) {
		if([webCoreJavaScript respondsToSelector:@selector (setShouldPrintExceptions:)])
			[webCoreJavaScript setShouldPrintExceptions:NO];
	}
}

+ (NSString *)webScriptNameForSelector:(SEL)aSelector
{
	if(aSelector == @selector(registerWidget:withKey:))
		return @"registerWidget";
		
	if(aSelector == @selector(initWidget:))
		return @"initWidget";
		
	if(aSelector == @selector(findWidget:))
		return @"findWidget";
				
	if(aSelector == @selector(track))
		return @"track";
		
	if(aSelector == @selector(pause))
		return @"pause";
		
	if(aSelector == @selector(resume))
		return @"resume";
		
	return nil;
}

+ (BOOL)isSelectorExcludedFromWebScript:(SEL)aSelector
{
	if(aSelector == @selector(registerWidget:withKey:))
		return NO;
		
	if(aSelector == @selector(initWidget:))
		return NO;
		
	if(aSelector == @selector(findWidget:))
		return NO;
		
	if(aSelector == @selector(track))
		return NO;
		
	if(aSelector == @selector(pause))
		return NO;
		
	if(aSelector == @selector(resume))
		return NO;
		
	return YES;
}

+ (BOOL)isKeyExcludedFromWebScript:(const char *)name
{
	return YES;
}

- (void)registerWidget:(NSString*)identifier withKey:(NSString*)key
{
	widgetID = [[NSString alloc] initWithString:identifier];

    WebPreferences* preferences = [parentWebView preferences];
    [preferences setJavaScriptCanOpenWindowsAutomatically:YES];
    
    [parentWebView setPolicyDelegate:self];
    [parentWebView setUIDelegate:self];

    NSString* bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
    if([bundleIdentifier isEqualToString:@"com.apple.dashboard.client"]) {
        usingDashboard = YES;
        
        dashboardView = [parentWebView superview];
        while([dashboardView superview])
            dashboardView = [dashboardView superview];
            
        dashboardWindow = [dashboardView window];
        
        if(dashboardWindow) {
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(becomeKey:) name:NSWindowDidBecomeKeyNotification object:dashboardWindow];
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(resignKey:) name:NSWindowDidResignKeyNotification object:dashboardWindow];
        }
    }
        
    trackPoint.x = 0;
    trackPoint.y = 0;
    
    NSRect trackFrame = [[NSScreen mainScreen] frame];
    trackHeight = trackFrame.size.height;
}

- (void)initWidget:(NSString*)identifier
{
	if([identifier hasPrefix:@"com.google.widget.googletalk"])
		allowBrowserSpawning = YES;
}

- (void)findWidget:(NSString*)location
{
	NSString* userWidgetFolder = nil;
	
	NSString* userFolder = (NSString*) CFPreferencesCopyAppValue(CFSTR("UserWidgetFolder"), CFSTR("com.mesadynamics.AmnestyGenerator"));
	if(userFolder) {
		userWidgetFolder = [[NSString alloc] initWithString:userFolder];
	}
	else {
		userWidgetFolder = [[NSString alloc] initWithFormat:@"%@/Library/Widgets", NSHomeDirectory()];
		
		CFPreferencesSetAppValue(CFSTR("UserWidgetFolder"), userWidgetFolder, CFSTR("com.mesadynamics.AmnestyGenerator"));	
		CFPreferencesAppSynchronize(CFSTR("com.mesadynamics.AmnestyGenerator"));
	}
	
	if(userWidgetFolder && location && [location isEqualToString:userWidgetFolder]) {
		didFind = YES;
	}
}

- (void)track
{
	if(didFind == NO)
		return;

	if(usingDashboard) {
		NSPoint p = [NSEvent mouseLocation];
		
		if(p.x == trackPoint.x && p.y == trackPoint.y)
			return;
			
		trackPoint = p;
		
		NSPoint global;
		global.x = (float) p.x;
		global.y = trackHeight - (float) p.y;
		
		NSPoint where = [parentWebView convertPoint:global toView:nil];

		NSEvent* mouseDownEvent = [NSEvent  
			mouseEventWithType:NSLeftMouseDown location:where
			modifierFlags:nil timestamp:CFAbsoluteTimeGetCurrent()
			windowNumber:0 context:nil eventNumber:nil clickCount:1  
			pressure:0.0];
			
		[NSApp postEvent:mouseDownEvent atStart:YES];

		NSEvent* mouseUpEvent = [NSEvent  
			mouseEventWithType:NSLeftMouseUp location:where
			modifierFlags:nil timestamp:CFAbsoluteTimeGetCurrent()
			windowNumber:0 context:nil eventNumber:nil clickCount:1  
			pressure:0.0];
			
		[NSApp postEvent:mouseUpEvent atStart:YES];
	}
}

- (void)pause
{
	if(didFind == NO)
		return;

	if(allowBrowserSpawning) {
		WebScriptObject* ws = [parentWebView windowScriptObject];
		[ws evaluateWebScript:@"generator_sleep()"];
		return;
	}
	
	/* JavaScript version:
	var gadget = document.getElementById("gadget");
	gadgetString = gadget.innerHTML;
	gadget.innerHTML = "";
	*/
	
	if(usingDashboard) {
		widgetView = [[parentWebView mainFrame] frameView];
		widgetParentView = [widgetView superview];
		
		[widgetView retain];
		[widgetView removeFromSuperviewWithoutNeedingDisplay];
		
		didPause = YES;
	}
}

- (void)resume
{
	if(didFind == NO)
		return;

	if(allowBrowserSpawning) {
		WebScriptObject* ws = [parentWebView windowScriptObject];
		[ws evaluateWebScript:@"generator_wake()"];
		return;
	}
	
	/* JavaScript version:
	if(gadgetString != "") {
		var gadget = document.getElementById("gadget");
		gadget.innerHTML = gadgetString;
		gadgetString = "";
	}
	*/
	
	if(usingDashboard && didPause == YES) {
		if(widgetView && widgetParentView) {
			[widgetParentView addSubview:widgetView];
			[widgetView release];
			
			widgetView = nil;
			widgetParentView = nil;
		}
			
		didPause = NO;
	}
}

- (void)launchURL:(NSURL*)url
{
	if(didFind == NO)
		return;

	if(launchInSafari) {
		[[NSWorkspace sharedWorkspace] openURLs:[NSArray arrayWithObject:url]
			withAppBundleIdentifier:@"com.apple.Safari"
			 options:0
			 additionalEventParamDescriptor:nil
			 launchIdentifiers:nil];
			 
		launchInSafari = NO;
	}
	else
		LSOpenCFURLRef((CFURLRef) url, NULL);
	
	if(usingDashboard) {
		WebScriptObject* ws = [parentWebView windowScriptObject];
		[ws evaluateWebScript:@"generator_dismiss()"];
	}
}

// Notifications
- (void)becomeKey:(id)sender
{
	[dashboardView setNeedsDisplayInRect:[dashboardView frame]];
}

- (void)resignKey:(id)sender
{
	[dashboardView setNeedsDisplayInRect:[dashboardView frame]];
}

// ResourceLoad delegate
- (id)webView:(WebView *)sender identifierForInitialRequest:(NSURLRequest *)request fromDataSource:(WebDataSource *)dataSource
{
	return nil;
}

// WebPolicy delegate
/*
- (void)webView:(WebView *)sender decidePolicyForMIMEType:(NSString *)type request:(NSURLRequest *)request frame:(WebFrame *)frame decisionListener:(id<WebPolicyDecisionListener>)listener
{
	NSLog(@"%@ %@ %@", type, [request URL], frame);
	[listener use];
}
*/

- (void)webView:(WebView *)sender decidePolicyForNavigationAction:(NSDictionary *)actionInformation request:(NSURLRequest *)request frame:(WebFrame *)frame decisionListener:(id<WebPolicyDecisionListener>)listener
{
	NSURL* url = [request URL];
	NSString* urlString = [url absoluteString];
														
	//NSLog([NSString stringWithFormat:@"sender %@ frame %@ url %@", sender, frame, url]);						
												
	if([sender isEqualTo:parentWebView] == NO) {
		if([urlString hasPrefix:@"http://www.google.com/support/talkgadget"]) {
			[self launchURL:url];
			
			[listener ignore];
		}
		else
			[listener use];

		return;
	}
	
	if([frame isEqual:[parentWebView mainFrame]]) {
		if([url isFileURL] == NO) {
			if([urlString hasPrefix:@"http://talkgadget.google.com/talkgadget/auth"])
				launchInSafari = YES;
				
			[self launchURL:url];
			
			[listener ignore];
			return;
		}
	}
	
	[listener use];
}

- (void)webView:(WebView *)sender decidePolicyForNewWindowAction:(NSDictionary *)actionInformation request:(NSURLRequest *)request newFrameName:(NSString *)frameName decisionListener:(id<WebPolicyDecisionListener>)listener
{
	NSURL* url = [request URL];
	[self launchURL:url];
	
	[listener ignore];
}

// WebUI delegate
- (WebView *)webView:(WebView *)sender createWebViewWithRequest:(NSURLRequest *)request
{
	NSURL* url = [request URL];
	if(url == nil)
		url = [request mainDocumentURL];
				
	//NSLog([NSString stringWithFormat:@"sender %@ newwindow url %@", sender, url]);						
				
	if(url)
		[self launchURL:url];
	else if(allowBrowserSpawning) {
		if(childWebView == nil) {
			NSRect frame = [parentWebView frame];
			childWebView = [[WebView alloc] initWithFrame:NSMakeRect(frame.size.width, 0, frame.size.width, frame.size.height) frameName:nil groupName:nil];
			[childWebView setPolicyDelegate:self];
			[childWebView setGroupName:[parentWebView groupName]];
			[childWebView setHidden:YES];
		}
		
		allowBrowserSpawning = NO;
		
		return childWebView;
	}
	
	return parentWebView;
}

#if 0
- (void)webView:(WebView *)sender mouseDidMoveOverElement:(NSDictionary *)elementInformation modifierFlags:(unsigned int)modifierFlags
{
	if(usingDashboard && usingFlash == NO && elementInformation) {
		DOMElement* object = [elementInformation objectForKey:WebElementDOMNodeKey]; 
		NSString* objectID = [object description];
		
		if(objectID &&
			(
				[objectID hasPrefix:@"<DOMHTMLElement [EMBED]"] ||
				[objectID hasPrefix:@"<DOMHTMLElement [OBJECT]"]
			)
		)
			usingFlash = YES;
	}
}
#endif

- (NSArray *)webView:(WebView *)sender contextMenuItemsForElement:(NSDictionary *)element defaultMenuItems:(NSArray *)defaultMenuItems
{
	return nil;
}
 
@end
