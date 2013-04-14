//
//  Generator.h
//  Generator
//
//  Created by Danny Espinoza on 10/4/06.
//  Copyright 2006 Mesa Dynamics, LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface Generator : NSObject {
	WebView* parentWebView;
	NSView* widgetView;
	NSView* widgetParentView;
	
	NSWindow* dashboardWindow;
	NSView* dashboardView;
	
	WebView* childWebView;
	
	NSString* widgetID;
	
	char* data;

	BOOL didFind;
	BOOL didPause;

	BOOL usingDashboard;
	BOOL usingFlash;
	BOOL allowBrowserSpawning;
	BOOL launchInSafari;
	
	NSPoint trackPoint;
	float trackHeight;
	double trackTime;
	
	NSString* elementFocus;
}

- (void)registerWidget:(NSString*)identifier withKey:(NSString*)key;
- (void)initWidget:(NSString*)identifier;
- (void)findWidget:(NSString*)location;

- (void)track;
- (void)pause;
- (void)resume;

- (void)launchURL:(NSURL*)url;

- (void)becomeKey:(id)sender;
- (void)resignKey:(id)sender;

@end

@interface WebView (ForcePublic)
- (void)setDrawsBackground:(BOOL)flag;
@end

