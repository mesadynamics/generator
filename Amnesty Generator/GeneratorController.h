//
//  GeneratorController.h
//  Amnesty Generator
//
//  Created by Danny Espinoza on 10/4/06.
//  Copyright 2006 Mesa Dynamics, LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>


@interface GeneratorController : NSWindowController {
	IBOutlet NSWindow* theAbout;
	IBOutlet NSButton* gadgets;
	IBOutlet NSPopUpButton* library;

	IBOutlet NSTextField* code;
	
	IBOutlet NSFormCell* name;
	IBOutlet NSFormCell* identifier;
	IBOutlet NSFormCell* width;
	IBOutlet NSFormCell* height;
	IBOutlet NSImageView* image;

	IBOutlet NSButton* generate;

	IBOutlet NSButton* saveReveal;
	IBOutlet NSButton* saveLaunch;
	IBOutlet NSView* saveExtra;

	IBOutlet WebView* help;
	
	NSMutableString* eName;
	NSMutableString* eIdentifier;
	NSMutableString* eWidth;
	NSMutableString* eHeight;
	
	int padWidth;
	int padHeight;
	BOOL margin;
	BOOL fullDrag;
	NSString* region;
	
	// prefs
	IBOutlet NSPanel* preferences;
	IBOutlet NSButton* saveWindowOnTop;
	IBOutlet NSButton* saveWindowPosition;
	NSPoint origin;
	float drawerWidth;
	BOOL openedDrawer;
	
	NSString* userWidgetFolder;
	
	// client integration
	char* widgetData;
	NSString* widgetName;
}

- (void)populateMenu;
- (void)selectMenuItem:(int)tag;

- (IBAction)handleLibrary:(id)sender;
- (IBAction)handleGadgets:(id)sender;
- (IBAction)handleCode:(id)sender;
- (IBAction)handleImage:(id)sender;
- (IBAction)handleGenerate:(id)sender;
- (IBAction)handleAbout:(id)sender;
- (IBAction)handleCenter:(id)sender;
- (IBAction)handlePreferenceOpen:(id)sender;
- (IBAction)handlePreferenceClose:(id)sender;


- (NSMutableString*)getAttribute:(NSString*)s pre:(NSString*)pre post:(NSString*)post;
- (NSMutableString*)getNextAttribute:(NSString*)s pre:(NSString*)pre post:(NSString*)post;
- (NSMutableString*)getReverseAttribute:(NSString*)s pre:(NSString*)pre post:(NSString*)post;

- (void)autoFillGoogle:(NSString*)code;
- (void)autoFillBitty:(NSString*)code;
- (void)autoFillYourMinis:(NSString*)code;
- (void)autoFillYourNYT:(NSString*)code;
- (void)autoFillInstacalc:(NSString*)code;
- (void)autoFillImeem:(NSString*)code;
- (void)autoFillWidgetBox:(NSString*)code;
- (void)autoFillSpringBox:(NSString*)code;
- (void)autoFillFineTune:(NSString*)code;
- (void)autoFillGrazr:(NSString*)code;
- (void)autoFill30Boxes:(NSString*)code;
- (void)autoFillBlinkx:(NSString*)code;
- (void)autoFillSlide:(NSString*)code;
- (void)autoFillGoogleVideo:(NSString*)code;
- (void)autoFillDailyMotion:(NSString*)code;
- (void)autoFillSmackArcade:(NSString*)code;
- (void)autoFillArcadeCabin:(NSString*)code;
- (void)autoFillSoapbox:(NSString*)code;
- (void)autoFillClockLink:(NSString*)code;
- (void)autoFillYouTube:(NSString*)code;
- (BOOL)autoFillFlash:(NSString*)code withCreator:(NSString*)creator siteTitle:(NSString*)site hashMarker:(NSString*)marker;

- (void)readPreferences;
- (void)writePreferences;

- (int)getWidgetVersion;

@end
