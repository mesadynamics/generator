//
//  GeneratorController.m
//  Amnesty Generator
//
//  Created by Danny Espinoza on 10/4/06.
//  Copyright 2006 Mesa Dynamics, LLC. All rights reserved.
//

#import "GeneratorController.h"
#import "WebIconDatabase.h"


#define kMaxMenuItems 42

enum {
	tagNone = 0,
	
	// .80b
	tagGoogle = 100,
	tagSpringwidgets = 200,
	tagClockLink = 300,
	tagGrazr = 400,
	tagPicGames = 500,
	tagWidgetbox = 600,
	tagSlide = 700,
	tagYouTube = 800,
	
	// .90b
	tagGoogleMaps = 900,
	tagFunny4MySpace = 1000,
	tagSmackArcade = 1100,
	tag30Boxes = 1200,
	tagFineTune = 1300,
	tagGoogleCalendar = 1400,
	tagAniBoom = 1500,
	tagBlinkx = 1600,
	tagClipshack = 1700,
	tagDailyMotion = 1800,
	tagGoogleVideo = 1900,
	tagJumpCut = 2000,
	tagMetaCafe = 2100,
	tagRevver = 2200,
	tagSoapbox = 2300,
	tagVidiac = 2400,
	tagInstaCalc = 2500,
	tagBolt = 2600,
	tagGuba = 2700,
	tagVeoh = 2800,
	tagVidiLife = 2900,
	tagPhotoBucket = 3000,
	tagArcadeCabin = 3100,
	
	// 1.0
	tagPyzam = 3200,
	tagGoodWidgets = 3300,
	tagBitty = 3400,
	tagPoqBum = 3500,
	
	// 1.1
	tagYourMinis = 3600,
	tagBoxNet = 3700,
	tagImeem = 3800,
	tagTwango = 3900,
	
	// 1.2
	tagEbay = 4000,
	
	// 1.4
	tagRockYou = 4100,
	
	tagNYT = 4200,
	
/*	
	tagMyBlogLog = 3500,
	tagShelfari = 3600,
	tagCruxy = 3700,
	tagMuseStorm = 3900,
	tagClearSpring = 4000,
	tagDapper = 4100,
	tagBrightcove = 4200,
	tagPodTech = 4300
*/
};

struct menuMap {
	int tag;
	NSString* title;
	NSString* url;
} menuMap[kMaxMenuItems] = {
	{
		tagGoogle,
		@"Google Gadgets",
		@"http://www.google.com/ig/directory?synd=open",
	},
	{
		tagNone,
		@"MoreWidgets",
		nil,
	},
		{
			tagArcadeCabin,
			@"ArcadeCabin",
			@"http://www.arcadecabin.com/",
		},
		{
			tagFunny4MySpace,
			@"Funny4MySpace",
			@"http://www.funny4myspace.com/funnies/myspace-funnies.php",
		},
		{
			tagGoodWidgets,
			@"GoodWidgets*",
			@"http://www.goodwidgets.com/widgets/list",
		},
		/*{
			tagMuseStorm,
			@"MuseStorm",
			@"http://www.musestorm.com/widgets/central.jsp",
		},*/
		{
			tagPicGames,
			@"PicGames",
			@"http://arcade.picgames.com/",
		},
		{
			tagPoqBum,
			@"POQbum",
			@"http://www.poqbum.com/",
		},
		{
			tagPyzam,
			@"Pyzam",
			@"http://www.pyzam.com/toys.html",
		},
		{
			tagRockYou,
			@"RockYou!",
			@"http://www.rockyou.com/choose_widget.php",
		},
		{
			tagSmackArcade,
			@"SmackArcade",
			@"http://www.smackarcade.com/",
		},
		{
			tagSpringwidgets,
			@"SpringWidgets",
			@"http://www.springwidgets.com/widgets/",
		},
		{
			tagWidgetbox,
			@"Widgetbox",
			@"http://www.widgetbox.com/",
		},
		{
			tagYourMinis,
			@"yourminis",
			@"http://www.yourminis.com/minis",
		},
	{
		tagNYT,
		@"New York Times*",
		@"http://www.nytimes.com/services/timeswidgets/",
	},
	{
		tagNone,
		@"MoreObjects",
		nil,
	},
		{
			tag30Boxes,
			@"30 Boxes*",
			@"http://30boxes.com/",
		},
		{
			tagBitty,
			@"Bitty",
			@"http://www.bitty.com/widgets/",
		},
		{
			tagBlinkx,
			@"Blinkx",
			@"http://blinkx.com/",
		},
		{
			tagBoxNet,
			@"Box.net*",
			@"http://www.box.net/",
		},
		{
			tagClockLink,
			@"ClockLink",
			@"http://www.clocklink.com/ENG/gallery.htm",
		},
		{
			tagEbay,
			@"eBay To Go",
			@"http://togo.ebay.com/",
		},
		{
			tagFineTune,
			@"FineTune*",
			@"http://www.finetune.com/",
		},
		{
			tagGrazr,
			@"Grazr",
			@"http://www.grazr.com/config.html",
		},
/*{
			tagGoogleCalendar,
			@"Google Calendar*",
			@"http://calendar.google.com/",
		},
		{
			tagGoogleMaps,
			@"Google Map Search*",
			@"http://www.google.com/uds/solutions/wizards/mapsearch.html",
		},*/
		{
			tagImeem,
			@"imeem",
			@"http://www.imeem.com/playlists/",
		},
		{
			tagInstaCalc,
			@"instacalc",
			@"http://instacalc.com/",
		},
		/*{
			tagMyBlogLog,
			@"MyBlogLog*",
			@"http://www.mybloglog.com/",
		},
		{
			tagShelfari,
			@"Shelfari*",
			@"http://www.shelfari.com/",
		},*/
		{
			tagSlide,
			@"Slide",
			@"http://www.slide.com/arrange",
		},
	{
		tagYouTube,
		@"YouTube",
		@"http://www.youtube.com/sharing",
	},
	{
		tagNone,
		@"MoreVideo",
		nil,
	},
		{
			tagAniBoom,
			@"aniBOOM",
			@"http://www.aniboom.com/",
		},
		{
			tagBolt,
			@"Bolt",
			@"http://www.bolt.com/",
		},
		{
			tagClipshack,
			@"ClipShack",
			@"http://www.clipshack.com/",
		},
		/*{
			tagCruxy,
			@"Cruxy",
			@"https://www.cruxy.com/promote.jsp",
		},*/
		{
			tagDailyMotion,
			@"Dailymotion",
			@"http://www.dailymotion.com/",
		},
		{
			tagGoogleVideo,
			@"Google Video",
			@"http://video.google.com/",
		},
		{
			tagGuba,
			@"Guba",
			@"http://www.guba.com/",
		},
		{
			tagJumpCut,
			@"Jumpcut",
			@"http://www.jumpcut.com/",
		},
		{
			tagMetaCafe,
			@"Metacafe",
			@"http://www.metacafe.com/",
		},
		//{
		//	tagSoapbox,
		//	@"MSN soapbox*",
		//	@"http://soapbox.msn.com/",
		//},
		{
			tagPhotoBucket,
			@"Photobucket",
			@"http://photobucket.com/",
		},
		{
			tagRevver,
			@"Revver",
			@"http://www.revver.com/",
		},
		{
			tagTwango,
			@"twango",
			@"http://www.twango.com/tools/",
		},
		{
			tagVeoh,
			@"Veoh",
			@"http://www.veoh.com/",
		},
		{
			tagVidiac,
			@"Vidiac",
			@"http://www.vidiac.com/",
		},
		{
			tagVidiLife,
			@"vidiLife",
			@"http://www.vidilife.com/",
		},
};


@implementation GeneratorController

- (id)init
{
	[super init];

	if(self) {
		widgetData = NULL;
		widgetName = NULL;
		
		eName =  nil;
		eIdentifier = nil;
		eWidth = nil;
		eHeight = nil;

		padWidth = 0;
		padHeight = 0;
		margin = NO;
		fullDrag = NO;
		region = nil;
		
		userWidgetFolder = nil;

        openedDrawer = NO;
	}	

	return self;
}

- (NSString *)windowNibName
{
    return @"MainMenu";
}

- (void)awakeFromNib
{
	@try {
		Class webIconDatabaseClass = NSClassFromString(@"WebIconDatabase");
		// Since this is private API, it may go away; only call if the class exists.
		if (webIconDatabaseClass != Nil) {
			[webIconDatabaseClass performSelector:@selector(sharedIconDatabase)];
		}
	} @catch (NSException *exc) {
#pragma unused(exc)
	}
	
	NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
	if([defaults objectForKey:@"WebIconDatabaseEnabled"] == nil) {
		[defaults setObject:[NSNumber numberWithBool:YES] forKey:@"WebIconDatabaseEnabled"];
		[defaults setObject:@"~/Library/Icons" forKey:@"WebIconDatabaseDirectoryDefaultsKey"];
	}
	
	NSString* path = [[NSBundle mainBundle] pathForResource:@"help" ofType:@"htm"];
	NSURL* url = [NSURL fileURLWithPath:path];

	NSURLRequest* request = [NSURLRequest
		requestWithURL:url
		cachePolicy:NSURLRequestReloadIgnoringCacheData
		timeoutInterval:10.0];

	WebFrame* mainFrame = [help mainFrame];
	[mainFrame loadRequest:request];

	[self populateMenu];

	[NSApp setDelegate:self];

	[theAbout setLevel:NSStatusWindowLevel+1];
 	[theAbout center];
	
	[self readPreferences];

    WebIconDatabase* idb = [WebIconDatabase sharedIconDatabase];
    if(idb) {
        NSArray* libs = [library itemArray];
        NSEnumerator* itemEnumerator = [libs objectEnumerator];
        NSMenuItem* item;
        
        while(item = [itemEnumerator nextObject]) {
            NSImage* icon = nil;
            NSString* siteURL = [item toolTip];
            
            if(siteURL && [item tag])
                icon = [idb iconForURL:siteURL withSize:NSMakeSize(16.0, 16.0)];
            
            if(icon)
                [item setImage:[[icon copy] autorelease]];
        }
    }
}

- (void)populateMenu
{
	NSDictionary* smallFont = [NSDictionary dictionaryWithObject:[NSFont menuFontOfSize:10.0] forKey:NSFontAttributeName];
	NSMenu* menu = [library menu];
	
	int i, j;
	for(i = 0, j = 0; i < kMaxMenuItems; i++, j++) {
		NSString* title = menuMap[i].title;
		NSAttributedString* atitle = nil;
		
		if(menuMap[i].url == nil) {
			title = NSLocalizedString(menuMap[i].title, @"");
			atitle = [[NSAttributedString alloc] initWithString:title attributes:smallFont];
		}
		
		NSMenuItem* item = [[NSMenuItem alloc] initWithTitle:title action:nil keyEquivalent:@""];
		[item setTag:menuMap[i].tag];
		
		if(atitle) {
			[item setAttributedTitle:atitle];
			[atitle release];
		}

		if(menuMap[i].url == nil) {
			[item setEnabled:NO];
			[item setIndentationLevel:1];

			if(j > 1) {
				[menu insertItem:[NSMenuItem separatorItem] atIndex:j-1];
				j++;
			}
		}
		else {
			[item setEnabled:YES];
			[item setToolTip:menuMap[i].url];
		}
		
		[menu insertItem:item atIndex:j];
	}

	NSString* title = [NSString stringWithFormat:@"* %@", NSLocalizedString(@"Disclaimer", @"")];
	NSMenuItem* item = [[NSMenuItem alloc] initWithTitle:title action:nil keyEquivalent:@""];
	NSAttributedString* atitle = [[NSAttributedString alloc] initWithString:title attributes:smallFont];
	[item setAttributedTitle:atitle];
	[atitle release];
	[item setEnabled:NO];
	[menu addItem:item];
	
	[library setAutoenablesItems:NO];
}

- (void)selectMenuItem:(int)tag
{
    [library selectItemWithTag:tag];
}

- (IBAction)handleLibrary:(id)sender
{
	NSMenuItem* item = [library selectedItem];
	
	switch([item tag]) {
		case tagGoogle:
			[help stringByEvaluatingJavaScriptFromString:@"ShowHelp('tagGoogle')"];
			break;
		
			case tagArcadeCabin:
				[help stringByEvaluatingJavaScriptFromString:@"ShowHelp('tagArcadeCabin')"];
				break;
			
			case tagFunny4MySpace:
				[help stringByEvaluatingJavaScriptFromString:@"ShowHelp('tagFunny4MySpace')"];
				break;
			
			case tagGoodWidgets:
				[help stringByEvaluatingJavaScriptFromString:@"ShowHelp('tagGoodWidgets')"];
				break;
			
			case tagPicGames:
				[help stringByEvaluatingJavaScriptFromString:@"ShowHelp('tagPicGames')"];
				break;
			
			case tagPoqBum:
				[help stringByEvaluatingJavaScriptFromString:@"ShowHelp('tagPoqBum')"];
				break;
			
			case tagPyzam:
				[help stringByEvaluatingJavaScriptFromString:@"ShowHelp('tagPyzam')"];
				break;
			
			case tagSmackArcade:
				[help stringByEvaluatingJavaScriptFromString:@"ShowHelp('tagSmackArcade')"];
				break;
			
			case tagSpringwidgets:
				[help stringByEvaluatingJavaScriptFromString:@"ShowHelp('tagSpringwidgets')"];
				break;
			
		case tagGrazr:
			[help stringByEvaluatingJavaScriptFromString:@"ShowHelp('tagGrazr')"];
			break;
		
			case tag30Boxes:
				[help stringByEvaluatingJavaScriptFromString:@"ShowHelp('tag30Boxes')"];
				break;
			
			case tagBitty:
				[help stringByEvaluatingJavaScriptFromString:@"ShowHelp('tagBitty')"];
				break;
			
			case tagBlinkx:
				[help stringByEvaluatingJavaScriptFromString:@"ShowHelp('tagBlinkx')"];
				break;
			
			case tagClockLink:
				[help stringByEvaluatingJavaScriptFromString:@"ShowHelp('tagClockLink')"];
				break;
			
			case tagFineTune:
				[help stringByEvaluatingJavaScriptFromString:@"ShowHelp('tagFineTune')"];
				break;
			
			case tagInstaCalc:
				[help stringByEvaluatingJavaScriptFromString:@"ShowHelp('tagInstaCalc')"];
				break;
			
			case tagSlide:
				[help stringByEvaluatingJavaScriptFromString:@"ShowHelp('tagSlide')"];
				break;
			
		case tagYouTube:
			[help stringByEvaluatingJavaScriptFromString:@"ShowHelp('tagYouTube')"];
			break;
		
			case tagAniBoom:
				[help stringByEvaluatingJavaScriptFromString:@"ShowHelp('tagAniBoom')"];
				break;
		
			case tagBolt:
				[help stringByEvaluatingJavaScriptFromString:@"ShowHelp('tagBolt')"];
				break;
		
			case tagClipshack:
				[help stringByEvaluatingJavaScriptFromString:@"ShowHelp('tagClipshack')"];
				break;
		
			case tagDailyMotion:
				[help stringByEvaluatingJavaScriptFromString:@"ShowHelp('tagDailyMotion')"];
				break;
		
			case tagGoogleVideo:
				[help stringByEvaluatingJavaScriptFromString:@"ShowHelp('tagGoogleVideo')"];
				break;
		
			case tagGuba:
				[help stringByEvaluatingJavaScriptFromString:@"ShowHelp('tagGuba')"];
				break;
		
			case tagJumpCut:
				[help stringByEvaluatingJavaScriptFromString:@"ShowHelp('tagJumpCut')"];
				break;
		
			case tagMetaCafe:
				[help stringByEvaluatingJavaScriptFromString:@"ShowHelp('tagMetaCafe')"];
				break;
		
			case tagSoapbox:
				[help stringByEvaluatingJavaScriptFromString:@"ShowHelp('tagSoapbox')"];
				break;
		
			case tagPhotoBucket:
				[help stringByEvaluatingJavaScriptFromString:@"ShowHelp('tagPhotoBucket')"];
				break;
		
			case tagRevver:
				[help stringByEvaluatingJavaScriptFromString:@"ShowHelp('tagRevver')"];
				break;
		
			case tagVeoh:
				[help stringByEvaluatingJavaScriptFromString:@"ShowHelp('tagVeoh')"];
				break;
		
			case tagVidiLife:
				[help stringByEvaluatingJavaScriptFromString:@"ShowHelp('tagVidiLife')"];
				break;
		
			case tagVidiac:
				[help stringByEvaluatingJavaScriptFromString:@"ShowHelp('tagVidiac')"];
				break;
		
		default:
			[help stringByEvaluatingJavaScriptFromString:@"ShowHelp('tagMissing')"];
	}
	
	[help setNeedsDisplay:YES];
}

- (IBAction)handleGadgets:(id)sender
{
	NSURL* target = nil;
	NSMenuItem* item = [library selectedItem];
	
	if([item tag])
		target = [NSURL URLWithString:[item toolTip]];

	if(target)
		LSOpenCFURLRef((CFURLRef) target, NULL);
}

- (IBAction)handleCode:(id)sender
{
	NSString* codeValue = [code stringValue];
	
	if(codeValue && [codeValue length]) {
		[generate setEnabled:YES];
		
		[eName release];
		[eIdentifier release];
		[eWidth release];
		[eHeight release];
		
		eName =  nil;
		eIdentifier = nil;
		eWidth = nil;
		eHeight = nil;
		
		padWidth = 0;
		padHeight = 0;
		margin = NO;
		fullDrag = NO;
		
		[region release];
		region = nil;

		NSString* trimmedCode = [codeValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
		NSMutableString* cleanedCode = [trimmedCode mutableCopy];
		[cleanedCode replaceOccurrencesOfString:@"&amp;" withString:@"&" options:0 range:NSMakeRange(0, [cleanedCode length])];
		
		NSRange googleCheck = [cleanedCode rangeOfString:@"gmodules.com"];
		NSRange arcadeCabinCheck = [cleanedCode rangeOfString:@"www.arcadecabin.com"];
		NSRange smackArcadeCheck = [cleanedCode rangeOfString:@"www.smackarcade.com"];
		NSRange springBoxCheck = [cleanedCode rangeOfString:@"downloads.thespringbox.com"];
		NSRange springWidgets = [cleanedCode rangeOfString:@"downloads.springwidgets.com"];
		NSRange widgetboxCheck1 = [cleanedCode rangeOfString:@"widgetserver.com"];
		NSRange widgetboxCheck2 = [cleanedCode rangeOfString:@"widgetbox.com"];
		NSRange yourMinisCheck = [cleanedCode rangeOfString:@"www.yourminis.com"];
		
		NSRange grazrCheck = [cleanedCode rangeOfString:@"grazr.com"];
		NSRange boxesCheck = [cleanedCode rangeOfString:@"30boxes.com"];
		NSRange bittyCheck = [cleanedCode rangeOfString:@"www.bitty.com"];
		NSRange blinkxCheck = [cleanedCode rangeOfString:@"www.blinkx.com"];
		NSRange clockLinkCheck = [cleanedCode rangeOfString:@"www.clocklink.com"];
		NSRange fineTuneCheck = [cleanedCode rangeOfString:@"www.finetune.com"];
		NSRange imeemCheck = [cleanedCode rangeOfString:@"media.imeem.com"];
		NSRange instacalcCheck = [cleanedCode rangeOfString:@"instacalc.com"];
		NSRange slideCheck = [cleanedCode rangeOfString:@"www.slide.com"];
		
		NSRange youTubeCheck = [cleanedCode rangeOfString:@"www.youtube.com"];
		NSRange dailyMotionCheck = [cleanedCode rangeOfString:@"www.dailymotion.com"];
		NSRange googleVideoCheck = [cleanedCode rangeOfString:@"video.google.com"];
		NSRange soapboxCheck = [cleanedCode rangeOfString:@"soapbox.msn.com"];
		NSRange nytCheck = [cleanedCode rangeOfString:@"nytimes.com"];
		
		// flash support (video)
		NSRange aniBoomCheck = [cleanedCode rangeOfString:@"api.aniboom.com"];
		NSRange boltCheck = [cleanedCode rangeOfString:@"www.bolt.com"];
		NSRange clipShackCheck = [cleanedCode rangeOfString:@"www.clipshack.com"];
		NSRange gubaCheck = [cleanedCode rangeOfString:@"www.guba.com"];
		NSRange jumpCutCheck = [cleanedCode rangeOfString:@"www.jumpcut.com"];
		NSRange metaCafeCheck = [cleanedCode rangeOfString:@"www.metacafe.com"];
		NSRange photoBucketCheck = [cleanedCode rangeOfString:@"photobucket.com"];
		NSRange revverCheck = [cleanedCode rangeOfString:@"flash.revver.com"];
		NSRange twangoCheck = [cleanedCode rangeOfString:@"www.twango.com"];
		NSRange veohCheck = [cleanedCode rangeOfString:@"www.veoh.com"];
		NSRange vidiacCheck = [cleanedCode rangeOfString:@"www.vidiac.com"];		
		NSRange vidiLifeCheck = [cleanedCode rangeOfString:@"www.vidiLife.com"];
		
		// flash support (other)
		NSRange boxNetCheck1 = [cleanedCode rangeOfString:@"www.box.net/static/flash/widget_player.swf"];
		NSRange boxNetCheck2 = [cleanedCode rangeOfString:@"www.box.net/static/flash/box_explorer.swf"];
		NSRange funny4Check = [cleanedCode rangeOfString:@"funny4myspace.com"];
		NSRange goodWidgetsCheck = [cleanedCode rangeOfString:@"goodwidgets.com"];
		//NSRange miniClipCheck = [cleanedCode rangeOfString:@"www.miniclip.com"];
		NSRange picGamesCheck = [cleanedCode rangeOfString:@"arcade.picgames.com"];
		NSRange poqbumCheck = [cleanedCode rangeOfString:@"www.poqbum.com"];
		NSRange pyzamCheck = [cleanedCode rangeOfString:@"www.pyzam.com"];
		NSRange ebayCheck = [cleanedCode rangeOfString:@"togo.ebay.com"];
		NSRange rockYouCheck = [cleanedCode rangeOfString:@"rockyou.com"];
			
		// hidden support
		NSRange brightcoveCheck = [cleanedCode rangeOfString:@"services.brightcove.com"];
		NSRange cfCheck = [cleanedCode rangeOfString:@"channelfrederator.com"];
		NSRange clearSpringCheck1 = [cleanedCode rangeOfString:@"widgets.clearspring.com"];
		NSRange clearSpringCheck2 = [cleanedCode rangeOfString:@"widgets.ivillage.com"];
		NSRange cruxyCheck = [cleanedCode rangeOfString:@"www.cruxy.com"];
		NSRange dapperCheck = [cleanedCode rangeOfString:@"www.dappit.com"];  // ?
		NSRange flixFocusCheck = [cleanedCode rangeOfString:@"www.flixfocus.com"];
		NSRange podTechCheck = [cleanedCode rangeOfString:@"www.podtech.net"];
		NSRange splashCastCheck = [cleanedCode rangeOfString:@"web.splashcast.net"];
		NSRange vimeoCheck = [cleanedCode rangeOfString:@"www.vimeo.com"];
		
		NSRange flashCheck = [cleanedCode rangeOfString:@".swf"];
		
		if(googleCheck.location != NSNotFound)
			[self autoFillGoogle:cleanedCode];
		else if(arcadeCabinCheck.location != NSNotFound)
			[self autoFillArcadeCabin:cleanedCode];
		else if(smackArcadeCheck.location != NSNotFound)
			[self autoFillSmackArcade:cleanedCode];
		else if(springBoxCheck.location != NSNotFound || springWidgets.location != NSNotFound)
			[self autoFillSpringBox:cleanedCode];
		else if(widgetboxCheck1.location != NSNotFound || widgetboxCheck2.location != NSNotFound)
			[self autoFillWidgetBox:cleanedCode];
		else if(yourMinisCheck.location != NSNotFound)
			[self autoFillYourMinis:cleanedCode];
		else if(nytCheck.location != NSNotFound)
			[self autoFillYourNYT:cleanedCode];
			
		else if(grazrCheck.location != NSNotFound)
			[self autoFillGrazr:cleanedCode];
		else if(boxesCheck.location != NSNotFound)
			[self autoFill30Boxes:cleanedCode];
		else if(bittyCheck.location != NSNotFound)
			[self autoFillBitty:cleanedCode];			
		else if(blinkxCheck.location != NSNotFound)
			[self autoFillBlinkx:cleanedCode];
		else if(clockLinkCheck.location != NSNotFound)
			[self autoFillClockLink:cleanedCode];
		else if(fineTuneCheck.location != NSNotFound)
			[self autoFillFineTune:cleanedCode];
		else if(imeemCheck.location != NSNotFound)
			[self autoFillImeem:cleanedCode];
		else if(instacalcCheck.location != NSNotFound)
			[self autoFillInstacalc:cleanedCode];
		else if(slideCheck.location != NSNotFound)
			[self autoFillSlide:cleanedCode];
			
		else if(youTubeCheck.location != NSNotFound)
			[self autoFillYouTube:cleanedCode];
		else if(dailyMotionCheck.location != NSNotFound)
			[self autoFillDailyMotion:cleanedCode];
		else if(googleVideoCheck.location != NSNotFound)
			[self autoFillGoogleVideo:cleanedCode];
		else if(soapboxCheck.location != NSNotFound)
			[self autoFillSoapbox:cleanedCode];
			
		else if(aniBoomCheck.location != NSNotFound) {
			if([self autoFillFlash:cleanedCode withCreator:@"com.aniboom" siteTitle:@"aniBOOM" hashMarker:@"videoar="] == YES) {
				[self selectMenuItem:tagAniBoom];
			}
		}
		else if(boltCheck.location != NSNotFound) {
			if([self autoFillFlash:cleanedCode withCreator:@"com.bolt" siteTitle:@"Bolt" hashMarker:@"contentId="] == YES) {
				padHeight = 28;
				
				[self selectMenuItem:tagBolt];
			}
		}
		else if(clipShackCheck.location != NSNotFound) {
			if([self autoFillFlash:cleanedCode withCreator:@"com.clipshack" siteTitle:@"Clipshack" hashMarker:@"key="] == YES) {
				[self selectMenuItem:tagClipshack];
			}
		}
		else if(gubaCheck.location != NSNotFound) {
			if([self autoFillFlash:cleanedCode withCreator:@"com.guba" siteTitle:@"Guba" hashMarker:@"src=\""] == YES) {
				[self selectMenuItem:tagGuba];
			}
		}
		else if(jumpCutCheck.location != NSNotFound) {
			if([self autoFillFlash:cleanedCode withCreator:@"com.jumpcut" siteTitle:@"Jumpcut" hashMarker:@"asset_id="] == YES) {
				[self selectMenuItem:tagJumpCut];
			}
		}
		else if(metaCafeCheck.location != NSNotFound) {
			if([self autoFillFlash:cleanedCode withCreator:@"com.metacafe" siteTitle:nil hashMarker:nil] == YES) {
				padHeight = 28;
				
				[self selectMenuItem:tagMetaCafe];
			}
		}
		else if(photoBucketCheck.location != NSNotFound) {
			if([self autoFillFlash:cleanedCode withCreator:@"com.photobucket" siteTitle:@"Photobucket" hashMarker:@"src=\""] == YES) {
				[self selectMenuItem:tagPhotoBucket];
			}
		}
		else if(revverCheck.location != NSNotFound) {
			if([self autoFillFlash:cleanedCode withCreator:@"com.revver" siteTitle:@"Revver" hashMarker:@"mediaId:"] == YES) {
				[self selectMenuItem:tagRevver];
			}
		}
		else if(twangoCheck.location != NSNotFound) {
			if([self autoFillFlash:cleanedCode withCreator:@"com.twango" siteTitle:@"twango" hashMarker:@""] == YES) {
				[self selectMenuItem:tagTwango];
			}
		}
		else if(veohCheck.location != NSNotFound) {
			if([self autoFillFlash:cleanedCode withCreator:@"com.veoh" siteTitle:@"Veoh" hashMarker:@"permalinkId="] == YES) {
				[self selectMenuItem:tagVeoh];
			}
		}
		else if(vidiacCheck.location != NSNotFound) {
			if([self autoFillFlash:cleanedCode withCreator:@"com.vidiac" siteTitle:@"Vidiac" hashMarker:@"video="] == YES) {
				[self selectMenuItem:tagVidiac];
			}
		}
		else if(vidiLifeCheck.location != NSNotFound) {
			if([self autoFillFlash:cleanedCode withCreator:@"com.vidilife" siteTitle:@"vidiLife" hashMarker:@"cryp="] == YES) {
				padHeight = 20;
				
				[self selectMenuItem:tagVidiLife];
			}
		}
		
		else if(boxNetCheck1.location != NSNotFound) {
			if([self autoFillFlash:cleanedCode withCreator:@"net.box" siteTitle:@"Box.net" hashMarker:@"folderId="] == YES) {
				[self selectMenuItem:tagBoxNet];
			}
		}
		else if(boxNetCheck2.location != NSNotFound) {
			if([self autoFillFlash:cleanedCode withCreator:@"net.box" siteTitle:@"Box.net" hashMarker:@"widgetHash="] == YES) {
				[self selectMenuItem:tagBoxNet];
			}
		}
		else if(funny4Check.location != NSNotFound) {
			if([self autoFillFlash:cleanedCode withCreator:@"com.funny4myspace" siteTitle:nil hashMarker:nil] == YES) {
				padHeight = 28;
				
				[self selectMenuItem:tagFunny4MySpace];
			}
		}
		else if(goodWidgetsCheck.location != NSNotFound) {
			if([self autoFillFlash:cleanedCode withCreator:@"com.goodwidgets" siteTitle:nil hashMarker:nil] == YES) {
				[self selectMenuItem:tagGoodWidgets];
			}
		}
		/*else if(miniClipCheck.location != NSNotFound) {
			if([self autoFillFlash:cleanedCode withCreator:@"com.miniclip" siteTitle:nil hashMarker:nil] == YES) {
				[self selectMenuItem:tagMiniclip];
			}
		}*/
		else if(picGamesCheck.location != NSNotFound) {
			if([self autoFillFlash:cleanedCode withCreator:@"com.picgames" siteTitle:nil hashMarker:nil] == YES) {
				[self selectMenuItem:tagPicGames];
			}
		}
		else if(poqbumCheck.location != NSNotFound) {
			if([self autoFillFlash:cleanedCode withCreator:@"com.poqbum" siteTitle:nil hashMarker:nil] == YES) {
				padHeight = 56;
				
				[self selectMenuItem:tagPoqBum];
			}
		}
		else if(pyzamCheck.location != NSNotFound) {
			if([self autoFillFlash:cleanedCode withCreator:@"com.pyzam" siteTitle:nil hashMarker:nil] == YES) {
				padHeight = 56;
				
				[self selectMenuItem:tagPyzam];
			}
		}
		else if(ebayCheck.location != NSNotFound) {
			if([self autoFillFlash:cleanedCode withCreator:@"com.ebay" siteTitle:@"eBay To Go" hashMarker:@""] == YES) {
				[self selectMenuItem:tagEbay];
			}
		}
		
		else if(brightcoveCheck.location != NSNotFound) {
			if([self autoFillFlash:cleanedCode withCreator:@"com.brightcove" siteTitle:@"Brightcove" hashMarker:@"videoId="] == YES) {
				//[self selectMenuItem:tagBrightcove];
			}
		}
		else if(cfCheck.location != NSNotFound) {
			if([self autoFillFlash:cleanedCode withCreator:@"com.channelfrederator" siteTitle:@"ChannelFrederator" hashMarker:nil] == YES) {
			}
		}
		else if(rockYouCheck.location != NSNotFound) {
			if([self autoFillFlash:cleanedCode withCreator:@"com.rockyou" siteTitle:@"RockYou" hashMarker:@""] == YES) {
				//[self selectMenuItem:tagClearSpring];
			}
		}
		else if(clearSpringCheck1.location != NSNotFound || clearSpringCheck2.location != NSNotFound) {
			if([self autoFillFlash:cleanedCode withCreator:@"com.clearspring" siteTitle:@"Clearspring" hashMarker:@"id=\""] == YES) {
				//[self selectMenuItem:tagClearSpring];
			}
		}
		else if(cruxyCheck.location != NSNotFound) {
			if([self autoFillFlash:cleanedCode withCreator:@"com.cruxy" siteTitle:@"Cruxy" hashMarker:@""] == YES) {
				//[self selectMenuItem:tagCruxy];
			}
		}
		else if(dapperCheck.location != NSNotFound) {
			if([self autoFillFlash:cleanedCode withCreator:@"net.dapper" siteTitle:@"Dapper" hashMarker:@"src=\""] == YES) {
				padHeight = 82;
				//[self selectMenuItem:tagDapper];
			}
		}
		else if(flixFocusCheck.location != NSNotFound) {
			if([self autoFillFlash:cleanedCode withCreator:@"com.flixfocus" siteTitle:@"FlixFocus" hashMarker:@"pg="] == YES) {
			}
		}
		else if(podTechCheck.location != NSNotFound) {
			if([self autoFillFlash:cleanedCode withCreator:@"net.podtech" siteTitle:@"PodTech" hashMarker:@"bc="] == YES) {
				//[self selectMenuItem:tagPodTech];
			}
		}
		else if(splashCastCheck.location != NSNotFound) {
			if([self autoFillFlash:cleanedCode withCreator:@"com.splashcastmedia" siteTitle:@"SplashCast" hashMarker:nil] == YES) {
			}
		}
		else if(vimeoCheck.location != NSNotFound) {
			if([self autoFillFlash:cleanedCode withCreator:@"com.vimeo" siteTitle:@"Vimeo" hashMarker:@"clip_id="] == YES) {
			}
		}

		else if(flashCheck.location != NSNotFound) {
			if([self autoFillFlash:cleanedCode withCreator:nil siteTitle:nil hashMarker:nil])
				margin = YES;
		}
		
		if(eName) {
			NSString* nameValue = [name stringValue];
			if(nameValue == nil || [nameValue length] == 0)
				[name setObjectValue:[eName stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
		}
		
		if(eIdentifier) {
			NSString* idValue = [identifier stringValue];
			if(idValue == nil || [idValue length] == 0)
				[identifier setObjectValue:eIdentifier];
		}

		int savedWidth = 0;
		if(eWidth) {
			savedWidth = [eWidth intValue];
			if(savedWidth == INT_MAX || savedWidth == INT_MIN)
				savedWidth = 0;
		}
		
		int savedHeight = 0;
		if(eHeight) {
			savedHeight = [eHeight intValue];
			if(savedHeight == INT_MAX || savedHeight == INT_MIN)
				savedHeight = 0;
		}
		
		if(eWidth) {
			NSString* widthValue = [width stringValue];
			if(widthValue == nil || [widthValue length] == 0) {
				if([eWidth hasSuffix:@"%"] && savedHeight && savedWidth)
					savedWidth = (savedHeight * 100) / savedWidth;

				if(savedWidth)
					[width setObjectValue:[NSString stringWithFormat:@"%d", savedWidth]];
			}
		}
		
		if(eHeight) {
			NSString* heightValue = [height stringValue];
			if(heightValue == nil || [heightValue length] == 0) {
				if([eHeight hasSuffix:@"%"] && savedWidth && savedHeight)
					savedHeight = (savedWidth * 100) / savedHeight;

				if(savedHeight)
					[height setObjectValue:[NSString stringWithFormat:@"%d", savedHeight]];
			}
		}
		
		[name performClick:self];
	}
	else
		[generate setEnabled:NO];
}

- (IBAction)handleImage:(id)sender
{
}

- (IBAction)handleGenerate:(id)sender
{
	NSString* codeValue = [code stringValue];
	if(codeValue == nil || [codeValue length] == 0) {
		NSBeep();
		return;
	}	
	
	NSString* nameValue = [name stringValue];
	if(nameValue == nil || [nameValue length] == 0) {
		[name performClick:self]; 
		NSBeep();
		return;
	}	
	
	NSString* idValue = [identifier stringValue];
	if(idValue == nil || [idValue length] == 0) {
		[identifier performClick:self]; 
		NSBeep();
		return;
	}
	
	NSString* widthValue = [width stringValue];
	if(widthValue == nil || [widthValue length] == 0) {
		[width performClick:self]; 
		NSBeep();
		return;
	}

	NSString* heightValue = [height stringValue];
	if(heightValue == nil || [heightValue length] == 0) {
		[height performClick:self]; 
		NSBeep();
		return;
	}
	
	{
		int version1 = 0;
		int version2 = 0;	
		NSString* tempBlock1 = [NSString stringWithFormat:@"%@%@", idValue, @"Generator"];
		NSString* tempBlock2 = [NSString stringWithFormat:@"%@%@", @"widgetplugin", idValue];
		const char* tempString1 = [tempBlock1 UTF8String];
		if(tempString1) {
			long len = strlen(tempString1);
			widgetData = (char*) malloc(len+1);
			if(widgetData) {
				memcpy(widgetData, tempString1, len+1);
				version1 = [self getWidgetVersion];
				free(widgetData);
			}
		}
		const char* tempString2 = [tempBlock2 UTF8String];
		if(tempString2) {
			long len = strlen(tempString2);
			widgetData = (char*) malloc(len+1);
			if(widgetData) {
				memcpy(widgetData, tempString2, len+1);
				version2 = [self getWidgetVersion];
				free(widgetData);
			}
		}
		if(version1 == 0 || version2 == 0)
			;
		else {
			NSString* v0 = [NSString stringWithFormat:@"%8x", version1];
			NSString* v1 = [NSString stringWithFormat:@"%8x", version2];
			
			NSString* s0 = [NSString stringWithFormat:@"%@%@", v0, v1];
			NSString* s1 = [s0 substringWithRange:NSMakeRange(0, 4)];
			NSString* s2 = [s0 substringWithRange:NSMakeRange(4, 4)];
			NSString* s3 = [s0 substringWithRange:NSMakeRange(8, 4)];
			NSString* s4 = [s0 substringWithRange:NSMakeRange(12, 4)];			
			NSString* sN = [NSString stringWithFormat:@"%@-%@-%@-%@", s1, s2, s3, s4];
			
			NSMutableString* temp = [sN mutableCopy];
			[temp replaceOccurrencesOfString:@" " withString:@"0" options:0 range:NSMakeRange(0, [temp length])];
			widgetName = [temp uppercaseString];
			[widgetName retain];
		}
	}	

	NSSavePanel* savePanel = [NSSavePanel savePanel];
	[savePanel setAccessoryView:saveExtra];
	[savePanel beginSheetForDirectory:nil file:nameValue modalForWindow:[self window] modalDelegate:(id)self didEndSelector:@selector(savePanelDidEnd:returnCode:contextInfo:) contextInfo:nil];
}

- (void)savePanelDidEnd:(NSSavePanel *)sheet returnCode:(int)returnCode contextInfo:(void  *)contextInfo
{	
	if(returnCode == NSFileHandlingPanelOKButton) {
		NSString* amnestyWidget = [NSString stringWithFormat:@"%@/Generator.wdgt", [[NSBundle mainBundle] resourcePath]];
		NSString* singleTemp = [NSString stringWithFormat:@"%@.wdgt", [sheet filename]];
		NSString* singleLocation = [singleTemp stringByDeletingLastPathComponent];
		NSString* singleName = [singleTemp lastPathComponent];
		
		if([[NSFileManager defaultManager] fileExistsAtPath:singleTemp]) {
			NSAlert* alert = nil;

			alert = [NSAlert alertWithMessageText:NSLocalizedString(@"ReplaceTitle", @"")
				defaultButton:NSLocalizedString(@"ReplaceOK", @"")
				alternateButton:NSLocalizedString(@"ReplaceCancel", @"")
				otherButton:nil
				informativeTextWithFormat:NSLocalizedString(@"ConfirmReplace", @""), singleName];

			[[alert window] setLevel:NSStatusWindowLevel+1];
			if([alert runModal] == 0) {
				return;
			}

			[[NSFileManager defaultManager] removeFileAtPath:singleTemp handler:nil];
		}

		if([[NSFileManager defaultManager] copyPath:amnestyWidget toPath:singleTemp handler:nil] == YES) {
			NSString* path = [NSString stringWithFormat:@"%@/Info.plist", singleTemp];
			NSData* plistData = [NSData dataWithContentsOfFile:path];
			
			NSString* error;
			NSPropertyListFormat format;
			id plist = [NSPropertyListSerialization propertyListFromData:plistData
				mutabilityOption:NSPropertyListImmutable
				format:&format
				errorDescription:&error];
				
			if(plist) {
				CFMutableDictionaryRef prefDict = CFDictionaryCreateMutableCopy(
					kCFAllocatorDefault,
					0,
					(CFDictionaryRef) plist);

				CFDictionarySetValue(prefDict, CFSTR("CFBundleName"), [name stringValue]);	
				CFDictionarySetValue(prefDict, CFSTR("CFBundleIdentifier"), [identifier stringValue]);
				NSNumber* h = [NSNumber numberWithInt:[height intValue] + padHeight + (margin == YES ? 40 :0)];
				CFDictionarySetValue(prefDict, CFSTR("Height"), h);
				NSNumber* w = [NSNumber numberWithInt:[width intValue] + padWidth + (margin == YES ? 40 :0)];
				CFDictionarySetValue(prefDict, CFSTR("Width"), w);
								
				plist = (id) prefDict;	
					
				NSData* xmlData = [NSPropertyListSerialization dataFromPropertyList:plist
					format:NSPropertyListXMLFormat_v1_0
					errorDescription:&error];
					
				if(xmlData)
					[xmlData writeToFile:path atomically:YES];
			}

			NSImage* icon = [image image];
			if(icon) {
				NSString* imagePath = [NSString stringWithFormat:@"%@/Icon.png", singleTemp];
				[[NSFileManager defaultManager] removeFileAtPath:imagePath handler:nil];
				
				NSSize size = [icon size]; 
				[icon lockFocus];
				NSBitmapImageRep* bits = [[NSBitmapImageRep alloc] initWithFocusedViewRect:NSMakeRect(0,0,size.width,size.height)];
				[icon unlockFocus];				
				
				NSData* png = [bits representationUsingType:NSPNGFileType properties:nil];
				[png writeToFile:imagePath atomically:NO];		
			}
			
			NSString* htmlPath = [NSString stringWithFormat:@"%@/generator.htm", singleTemp];
			NSString* htmlData = [NSString stringWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:nil];
				
			if(htmlData) {
				NSString* snippet = [code stringValue];

				NSRange googleCheck = [snippet rangeOfString:@"gmodules.com"];
				if(googleCheck.location != NSNotFound) {
					NSRange syndicationCheck = [snippet rangeOfString:@"synd=open"];
					if(syndicationCheck.location != NSNotFound) {
						NSMutableString* syndicationCode = [snippet mutableCopy];
						if(syndicationCode) {
							[syndicationCode replaceOccurrencesOfString:@"synd=open" withString:@"synd=amnesty" options:0 range:NSMakeRange(0, [syndicationCode length])];
							snippet = syndicationCode;
						}
					}
				}
				
				NSMutableString* mHtmlData = [htmlData mutableCopy];
				NSRange start = [mHtmlData rangeOfString:@"</div>"];
				[mHtmlData insertString:snippet atIndex:start.location];
				
				NSFileHandle* f = [NSFileHandle fileHandleForWritingAtPath:htmlPath];
				NSData* d = [mHtmlData dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
				[f truncateFileAtOffset:0];
				[f writeData:d];
				[f synchronizeFile];
				[f closeFile];
			}

			NSString* jsPath = [NSString stringWithFormat:@"%@/generator.js", singleTemp];
			NSString* jsData = [NSString stringWithContentsOfFile:jsPath encoding:NSUTF8StringEncoding error:nil];
			
			if(jsData) {
				NSMutableString* mJsData = [jsData mutableCopy];
				[mJsData replaceOccurrencesOfString:@"RegisterWidget" withString:[identifier stringValue] options:0 range:NSMakeRange(0, [mJsData length])];
				[mJsData replaceOccurrencesOfString:@"0000-0000-0000-0000" withString:widgetName options:0 range:NSMakeRange(0, [mJsData length])];
				[mJsData replaceOccurrencesOfString:@"InitWidget" withString:[identifier stringValue] options:0 range:NSMakeRange(0, [mJsData length])];
				[mJsData replaceOccurrencesOfString:@"UserWidgetFolder" withString:userWidgetFolder options:0 range:NSMakeRange(0, [mJsData length])];
				
				NSFileHandle* f = [NSFileHandle fileHandleForWritingAtPath:jsPath];
				NSData* d = [mJsData dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
				[f truncateFileAtOffset:0];
				[f writeData:d];
				[f synchronizeFile];
				[f closeFile];
			}
			
			if(margin || region || fullDrag) {
				NSString* cssPath = [NSString stringWithFormat:@"%@/generator.css", singleTemp];
				NSString* cssData = [NSString stringWithContentsOfFile:cssPath encoding:NSUTF8StringEncoding error:nil];
				
				if(cssData) {
					NSMutableString* mCssData = [cssData mutableCopy];
					if(margin)
						[mCssData replaceOccurrencesOfString:@"0px;" withString:@"20px;" options:0 range:NSMakeRange(0, [mCssData length])];
						
					if(region)
						[mCssData replaceOccurrencesOfString:@"none" withString:region options:0 range:NSMakeRange(0, [mCssData length])];
					
					if(fullDrag)
						[mCssData replaceOccurrencesOfString:@"dashboard-region(control rectangle 0px 0px 0px 0px)" withString:@"none" options:0 range:NSMakeRange(0, [mCssData length])];
					
					NSFileHandle* f = [NSFileHandle fileHandleForWritingAtPath:cssPath];
					NSData* d = [mCssData dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
					[f truncateFileAtOffset:0];
					[f writeData:d];
					[f synchronizeFile];
					[f closeFile];
				}
			}
			
			{
				//LSRegisterURL((CFURLRef) [sheet URL], true);

				if([saveReveal intValue] == YES) {
					NSURL* target = [NSURL fileURLWithPath:singleLocation];
					if(target)
						LSOpenCFURLRef((CFURLRef) target, NULL);
				}
				
				if([saveLaunch intValue] == YES) {
					NSURL* target = [NSURL fileURLWithPath:singleTemp];
					if(target)
						LSOpenCFURLRef((CFURLRef) target, NULL);
				}
			}
			
			[[self window] orderOut:self];
		}
	}
}

- (IBAction)handleAbout:(id)sender
{
	[theAbout display];
	[theAbout makeKeyAndOrderFront:sender];	
}

- (IBAction)handleCenter:(id)sender
{
	[[self window] center];
}

- (IBAction)handlePreferenceOpen:(id)sender
{
	[NSApp beginSheet:preferences
		modalForWindow:[self window]
		modalDelegate:nil
		didEndSelector:nil 
		contextInfo:nil];
		
	[NSApp runModalForWindow:preferences];
	
	[NSApp endSheet:preferences];
	[preferences orderOut:self];
}

- (IBAction)handlePreferenceClose:(id)sender
{
	[NSApp stopModal];

	if([saveWindowOnTop state] == NSOnState)
		[[self window] setLevel:NSStatusWindowLevel];
	else
		[[self window] setLevel:NSNormalWindowLevel];
}

- (NSMutableString*)getAttribute:(NSString*)s pre:(NSString*)pre post:(NSString*)post
{
	NSRange start = [s rangeOfString:pre];

	if(start.location != NSNotFound) {
		start.location += [pre length];
		NSRange end = [[s substringFromIndex:start.location] rangeOfString:post];
		
		if(end.location != NSNotFound) {
			start.length = end.location;
			
			NSString* outString = [s substringWithRange:start];
			if(outString && [outString length])
				return [outString mutableCopy];
		}
	}
	
	return nil;
}

- (NSMutableString*)getNextAttribute:(NSString*)s pre:(NSString*)pre post:(NSString*)post
{
	NSRange start = [s rangeOfString:pre];

	if(start.location != NSNotFound) {
		start.location += [pre length];	
		start.length = [s length] - start.location;
		start = [s rangeOfString:pre options:0 range:start];
	}
		
	if(start.location != NSNotFound) {
		start.location += [pre length];
		NSRange end = [[s substringFromIndex:start.location] rangeOfString:post];
		
		if(end.location != NSNotFound) {
			start.length = end.location;
			
			NSString* outString = [s substringWithRange:start];
			if(outString && [outString length])
				return [outString mutableCopy];
		}
	}
	
	return nil;
}

- (NSMutableString*)getReverseAttribute:(NSString*)s pre:(NSString*)pre post:(NSString*)post
{
	NSRange start = [s rangeOfString:pre];

	if(start.location != NSNotFound) {
		NSRange end = [[s substringToIndex:start.location] rangeOfString:post options:NSBackwardsSearch];
		
		if(end.location != NSNotFound) {
			int offset = [post length];
			start.length = (start.location - end.location) - offset;
			start.location = end.location + offset;
			
			NSString* outString = [s substringWithRange:start];
			if(outString && [outString length])
				return [outString mutableCopy];
		}
	}
	
	return nil;
}

- (void)autoFillGoogle:(NSString*)script
{
	eName = [self getAttribute:script pre:@"&title=" post:@"&"];
	if(eName)
		[eName replaceOccurrencesOfString:@"+" withString:@" " options:0 range:NSMakeRange(0, [eName length])];

	NSString* identifierString = [self getReverseAttribute:script pre:@".xml" post:@"modules/"];
	if(identifierString) {
		eIdentifier = [[NSString alloc] initWithFormat:@"com.google.widget.%@", identifierString];
		[identifierString release];
	}
	else if(eName) {
		eIdentifier = [[NSString alloc] initWithFormat:@"com.google.widget.%@", eName];
	}
	
	eWidth = [self getAttribute:script pre:@"&w=" post:@"&"];
	eHeight = [self getAttribute:script pre:@"&h=" post:@"&"];

	NSRange border = [script rangeOfString:@"&border=%23ffffff%7C3px"];
	if(border.location == NSNotFound) {
		padHeight = 56;
		padWidth = 16;
	}
	else {
		padHeight = 50;
		padWidth = 10;
	}

	[self selectMenuItem:tagGoogle];
}

- (void)autoFillBitty:(NSString*)script
{
	int hash = [script hash];
	
	eName = [[NSString alloc] initWithFormat:@"Bitty %d", hash];
	eIdentifier = [[NSString alloc] initWithFormat:@"com.bitty.widget.%d", hash];
	eWidth = [self getAttribute:script pre:@"width: \"" post:@"\""];
	eHeight = [self getAttribute:script pre:@"height: \"" post:@"\""];

	fullDrag = YES;
	region = [[NSString alloc] initWithFormat:@"dashboard-region(control rectangle 80px 0px 28px 0px)"];
		
	[self selectMenuItem:tagBitty];
}

- (void)autoFillYourMinis:(NSString*)script
{
	
	NSString* identifierString = [self getAttribute:script pre:@"mini:" post:@"\""];
	if(identifierString) {
		eName = [[NSString alloc] initWithString:identifierString];
		eIdentifier = [[NSString alloc] initWithFormat:@"com.yourminis.widget.%@", identifierString];
		[identifierString release];
	}
	
	eWidth = [self getAttribute:script pre:@"width=\"" post:@"\""];
	if([eWidth isEqualToString:@"100%"])
		eWidth = [self getNextAttribute:script pre:@"width=\"" post:@"\""];
	
	eHeight = [self getAttribute:script pre:@"height=\"" post:@"\""];
	if([eHeight isEqualToString:@"100%"])
		eHeight = [self getNextAttribute:script pre:@"height=\"" post:@"\""];
	
	padHeight = 56;
	
	[self selectMenuItem:tagYourMinis];
}

- (void)autoFillYourNYT:(NSString*)script
{
	int hash = [script hash];
	
	eName = [[NSString alloc] initWithFormat:@"New York Times %d", hash];
	eIdentifier = [[NSString alloc] initWithFormat:@"com.nytimes.widget.%d", hash];
	
	eHeight = [self getAttribute:script pre:@"height=\"" post:@"\""];
	
	eWidth = [self getAttribute:script pre:@"width=\"" post:@"\""];
	if([eWidth isEqualToString:@"100%"])
		eWidth = eHeight;
		
	[self selectMenuItem:tagNYT];
}

- (void)autoFillInstacalc:(NSString*)script
{
	int hash = [script hash];

	eName = [[NSString alloc] initWithFormat:@"instacalc %d", hash];
	eIdentifier = [[NSString alloc] initWithFormat:@"com.instacalc.widget.%d", hash];
	eWidth = [self getAttribute:script pre:@"instacalc_embed_width = " post:@";"];
	eHeight = [self getAttribute:script pre:@"instacalc_embed_height = " post:@";"];

	[self selectMenuItem:tagInstaCalc];
}

- (void)autoFillImeem:(NSString*)script
{
	bool match = NO;
	
	NSString* identifierString = [self getAttribute:script pre:@"/pl/" post:@"/"];
	if(identifierString) {
		eName = [[NSString alloc] initWithFormat:@"imeem %@", identifierString];
		eIdentifier = [[NSString alloc] initWithFormat:@"com.imeem.widget.%@", identifierString];
		[identifierString release];
		
		match = YES;
	}
	else {
		identifierString = [self getAttribute:script pre:@"/v/" post:@"/"];
		if(identifierString) {
			eName = [[NSString alloc] initWithFormat:@"imeem %@", identifierString];
			eIdentifier = [[NSString alloc] initWithFormat:@"com.imeem.widget.%@", identifierString];
			[identifierString release];
		}
		
		match = YES;
	}

	if(match) {
		eWidth = [self getAttribute:script pre:@"width=\"" post:@"\""];
		eHeight = [self getAttribute:script pre:@"height=\"" post:@"\""];

		[self selectMenuItem:tagImeem];
	
		fullDrag = YES;
	}
}

// - no width or height to extract if script
- (void)autoFillWidgetBox:(NSString*)script
{
	NSString* identifierString = [self getAttribute:script pre:@"appId=" post:@"\""];
	if(identifierString) {
		eName = [[NSString alloc] initWithFormat:@"Widgetbox %@", identifierString];
		eIdentifier = [[NSString alloc] initWithFormat:@"com.widgetbox.widget.%@", identifierString];
		[identifierString release];

		eWidth = [self getAttribute:script pre:@"width=\"" post:@"px"];
		eHeight = [self getAttribute:script pre:@"height=\"" post:@"px"];
	}
	else {
		identifierString = [self getAttribute:script pre:@"panelId=" post:@"\""];
		if(identifierString) {
			eName = [[NSString alloc] initWithFormat:@"Widgetbox %@", identifierString];
			eIdentifier = [[NSString alloc] initWithFormat:@"com.widgetbox.widget.%@", identifierString];
			[identifierString release];
		}
	}

	[self selectMenuItem:tagWidgetbox];

	fullDrag = YES;
}

- (void)autoFillSpringBox:(NSString*)script
{
	eName = [self getReverseAttribute:script pre:@".sbw" post:@"="];
	eIdentifier = [[NSString alloc] initWithFormat:@"com.springwidgets.widget.%@", eName];
	
	eWidth = [self getAttribute:script pre:@"width=\"" post:@"\""];
	if([eWidth isEqualToString:@"1"])
		eWidth = [self getNextAttribute:script pre:@"width=\"" post:@"\""];
	
	eHeight = [self getAttribute:script pre:@"height=\"" post:@"\""];
	if([eHeight isEqualToString:@"1"])
		eHeight = [self getNextAttribute:script pre:@"height=\"" post:@"\""];

	if(eWidth == nil)
		eWidth = [self getAttribute:script pre:@"width:" post:@"px"];
	
	if(eHeight == nil)
		eHeight = [self getAttribute:script pre:@"height:" post:@"px"];
	
	padHeight = 28;
		
	[self selectMenuItem:tagSpringwidgets];
}

- (void)autoFillFineTune:(NSString*)script
{
	NSString* nameValue = [name stringValue];
	if(nameValue == nil || [nameValue length] == 0) {
		NSRange start = [script rangeOfString:@"pinst="];

		if(start.location != NSNotFound) {
			start.location += 9;
			NSRange end = [[script substringFromIndex:start.location] rangeOfString:@"\""];
			start.length = end.location;
			
			NSString* extracted = [script substringWithRange:start];
			if(extracted && [extracted length]) {
				NSString* autoValue = [NSString stringWithFormat:@"Finetune %@", extracted];
				[name setObjectValue:autoValue];
			}	
		}
	}

	NSString* idValue = [identifier stringValue];
	if(idValue == nil || [idValue length] == 0) {
		NSRange start = [script rangeOfString:@"pinst="];

		if(start.location != NSNotFound) {
			start.location += 9;
			NSRange end = [[script substringFromIndex:start.location] rangeOfString:@"\""];
			start.length = end.location;
			
			NSString* extracted = [script substringWithRange:start];
			if(extracted && [extracted length]) {
				NSString* autoValue = [NSString stringWithFormat:@"com.finetune.widget.%@", extracted];
				[identifier setObjectValue:autoValue];
			}
		}
	}
	
	eWidth = [self getAttribute:script pre:@"width=\"" post:@"\""];		
	eHeight = [self getAttribute:script pre:@"height=\"" post:@"\""];
	
	fullDrag = YES;
			
	[self selectMenuItem:tagFineTune];
}

- (void)autoFillGrazr:(NSString*)script
{
	int hash = [script hash];
	
	if(hash) {
		NSString* nameValue = [name stringValue];
		if(nameValue == nil || [nameValue length] == 0) {
			NSString* autoValue = [NSString stringWithFormat:@"Grazr %d", hash];
			[name setObjectValue:autoValue];
		}
		
		NSString* idValue = [identifier stringValue];
		if(idValue == nil || [idValue length] == 0) {
			NSString* autoValue = [NSString stringWithFormat:@"com.grazr.widget.%d", hash];
			[identifier setObjectValue:autoValue];
		}
	}
	
	eWidth = [self getAttribute:script pre:@"width:" post:@"px"];
	eHeight = [self getAttribute:script pre:@"height:" post:@"px"];
	
	fullDrag = YES;
	region = [[NSString alloc] initWithFormat:@"dashboard-region(control rectangle 50px 0px 0px 0px)"];
		
	[self selectMenuItem:tagGrazr];
}

- (void)autoFill30Boxes:(NSString*)script
{
	int hash = 0;
	{
		NSRange start = [script rangeOfString:@"src=\""];

		if(start.location != NSNotFound) {
			start.location += 5;
			NSRange end = [[script substringFromIndex:start.location] rangeOfString:@"\""];
			start.length = end.location;
			
			NSString* extracted = [script substringWithRange:start];
			if(extracted && [extracted length]) {
				hash = [extracted hash];
			}
		}
	}
	
	if(hash) {
		NSString* nameValue = [name stringValue];
		if(nameValue == nil || [nameValue length] == 0) {
			NSString* autoValue = [NSString stringWithFormat:@"30 Boxes %d", hash];
			[name setObjectValue:autoValue];
		}
		
		NSString* idValue = [identifier stringValue];
		if(idValue == nil || [idValue length] == 0) {
			NSString* autoValue = [NSString stringWithFormat:@"com.30boxes.widget.%d", hash];
			[identifier setObjectValue:autoValue];
		}
	}
	
	eWidth = [self getAttribute:script pre:@"width=\"" post:@"\""];		
	eHeight = [self getAttribute:script pre:@"height=\"" post:@"\""];

	fullDrag = YES;
	
	[self selectMenuItem:tag30Boxes];
}


- (void)autoFillBlinkx:(NSString*)script
{
	int hash = 0;
	{
		NSRange start = [script rangeOfString:@"g_sApiQuery="];

		if(start.location != NSNotFound) {
			start.location += 12;
			NSRange end = [[script substringFromIndex:start.location] rangeOfString:@"&"];
			start.length = end.location;
			
			NSString* extracted = [script substringWithRange:start];
			if(extracted && [extracted length]) {
				hash = [extracted hash];
			}
		}
	}
	
	if(hash) {
		NSString* nameValue = [name stringValue];
		if(nameValue == nil || [nameValue length] == 0) {
			NSString* autoValue = [NSString stringWithFormat:@"Blinkx %d", hash];
			[name setObjectValue:autoValue];
		}
		
		NSString* idValue = [identifier stringValue];
		if(idValue == nil || [idValue length] == 0) {
			NSString* autoValue = [NSString stringWithFormat:@"com.blinkx.widget.%d", hash];
			[identifier setObjectValue:autoValue];
		}
	}

	eWidth = [self getAttribute:script pre:@"width='" post:@"'"];		
	eHeight = [self getAttribute:script pre:@"height='" post:@"'"];
	
	fullDrag = YES;
	
	[self selectMenuItem:tagBlinkx];
}

- (void)autoFillSlide:(NSString*)script
{
	int hash = 0;
	{
		NSRange start = [script rangeOfString:@"channel="];

		if(start.location != NSNotFound) {
			start.location += 4;
			NSRange end = [[script substringFromIndex:start.location] rangeOfString:@"&"];
			start.length = end.location;
			
			NSString* extracted = [script substringWithRange:start];
			if(extracted && [extracted length]) {
				hash = [extracted hash];
			}
		}
	}
	
	if(hash) {
		NSString* nameValue = [name stringValue];
		if(nameValue == nil || [nameValue length] == 0) {
			NSString* autoValue = [NSString stringWithFormat:@"Slide %d", hash];
			[name setObjectValue:autoValue];
		}
		
		NSString* idValue = [identifier stringValue];
		if(idValue == nil || [idValue length] == 0) {
			NSString* autoValue = [NSString stringWithFormat:@"com.slide.widget.%d", hash];
			[identifier setObjectValue:autoValue];
		}
	}
	
	eWidth = [self getAttribute:script pre:@"width=\"" post:@"\""];
	eHeight = [self getAttribute:script pre:@"height=\"" post:@"\""];
	
	padHeight = 23;
	
	[self selectMenuItem:tagSlide];
}

- (void)autoFillGoogleVideo:(NSString*)script
{
	NSString* nameValue = [name stringValue];
	if(nameValue == nil || [nameValue length] == 0) {
		NSRange start = [script rangeOfString:@"docId="];

		if(start.location != NSNotFound) {
			start.location += 6;
			NSRange end = [[script substringFromIndex:start.location] rangeOfString:@"&"];
			start.length = end.location;
			
			NSString* extracted = [script substringWithRange:start];
			if(extracted && [extracted length]) {
				NSString* autoValue = [NSString stringWithFormat:@"Google Video %@", extracted];
				[name setObjectValue:autoValue];
			}	
		}
	}

	NSString* idValue = [identifier stringValue];
	if(idValue == nil || [idValue length] == 0) {
		NSRange start = [script rangeOfString:@"docId="];

		if(start.location != NSNotFound) {
			start.location += 6;
			NSRange end = [[script substringFromIndex:start.location] rangeOfString:@"\""];
			start.length = end.location;
			
			NSString* extracted = [script substringWithRange:start];
			if(extracted && [extracted length]) {
				NSString* autoValue = [NSString stringWithFormat:@"com.google.video.widget.%@", extracted];
				[identifier setObjectValue:autoValue];
			}
		}
	}
	
	eWidth = [self getAttribute:script pre:@"width:" post:@"px;"];
	eHeight = [self getAttribute:script pre:@"height:" post:@"px;"];

	[self selectMenuItem:tagGoogleVideo];
}

- (void)autoFillDailyMotion:(NSString*)script
{
	NSString* nameValue = [name stringValue];
	if(nameValue == nil || [nameValue length] == 0) {
		NSRange start = [script rangeOfString:@"/video/"];

		if(start.location != NSNotFound) {
			start.location += 7;
			NSRange end = [[script substringFromIndex:start.location] rangeOfString:@"\""];
			start.length = end.location;
			
			NSString* extracted = [script substringWithRange:start];
			if(extracted && [extracted length]) {
				[name setObjectValue:extracted];
			}
		}
	}
	
	NSString* idValue = [identifier stringValue];
	if(idValue == nil || [idValue length] == 0) {
		NSRange start = [script rangeOfString:@"/video/"];

		if(start.location != NSNotFound) {
			start.location += 7;
			NSRange end = [[script substringFromIndex:start.location] rangeOfString:@"\""];
			start.length = end.location;
			
			NSString* extracted = [script substringWithRange:start];
			if(extracted && [extracted length]) {
				NSString* autoValue = [NSString stringWithFormat:@"com.dailymotion.widget.%@", extracted];
				[identifier setObjectValue:autoValue];
			}
		}
	}
	
	eWidth = [self getAttribute:script pre:@"width=\"" post:@"\""];
	eHeight = [self getAttribute:script pre:@"height=\"" post:@"\""];
	
	padHeight = 42;
	
	[self selectMenuItem:tagDailyMotion];
}

- (void)autoFillSmackArcade:(NSString*)script
{
	NSString* nameValue = [name stringValue];
	if(nameValue == nil || [nameValue length] == 0) {
		NSRange start = [script rangeOfString:@"/play/"];

		if(start.location != NSNotFound) {
			start.location += 6;
			NSRange end = [[script substringFromIndex:start.location] rangeOfString:@"\""];
			start.length = end.location;
			
			NSString* extracted = [script substringWithRange:start];
			if(extracted && [extracted length]) {
				[name setObjectValue:extracted];
			}
		}
	}
	
	NSString* idValue = [identifier stringValue];
	if(idValue == nil || [idValue length] == 0) {
		NSRange start = [script rangeOfString:@"/play/"];

		if(start.location != NSNotFound) {
			start.location += 6;
			NSRange end = [[script substringFromIndex:start.location] rangeOfString:@"\""];
			start.length = end.location;
			
			NSString* extracted = [script substringWithRange:start];
			if(extracted && [extracted length]) {
				NSString* autoValue = [NSString stringWithFormat:@"com.smackarcade.widget.%@", extracted];
				[identifier setObjectValue:autoValue];
			}
		}
	}
	
	eWidth = [self getAttribute:script pre:@"width=\"" post:@"\""];
	eHeight = [self getAttribute:script pre:@"height=\"" post:@"\""];
	
	padHeight = 42;
	
	[self selectMenuItem:tagSmackArcade];
}

- (void)autoFillSoapbox:(NSString*)script
{
	NSString* nameValue = [name stringValue];
	if(nameValue == nil || [nameValue length] == 0) {
		NSRange start = [script rangeOfString:@"title=\""];

		if(start.location != NSNotFound) {
			start.location += 7;
			NSRange end = [[script substringFromIndex:start.location] rangeOfString:@"\""];
			start.length = end.location;
			
			NSString* extracted = [script substringWithRange:start];
			if(extracted && [extracted length]) {
				[name setObjectValue:extracted];
			}
		}
	}
	
	NSString* idValue = [identifier stringValue];
	if(idValue == nil || [idValue length] == 0) {
		NSRange start = [script rangeOfString:@"title=\""];

		if(start.location != NSNotFound) {
			start.location += 7;
			NSRange end = [[script substringFromIndex:start.location] rangeOfString:@"\""];
			start.length = end.location;
			
			NSString* extracted = [script substringWithRange:start];
			if(extracted && [extracted length]) {
				NSString* autoValue = [NSString stringWithFormat:@"com.msn.soapbox.widget.%@", extracted];
				[identifier setObjectValue:autoValue];
			}
		}
	}
	
	eWidth = [self getAttribute:script pre:@"width=\"" post:@"\""];		
	eHeight = [self getAttribute:script pre:@"height=\"" post:@"\""];
	
	padHeight = 28;
	
	[self selectMenuItem:tagSoapbox];
}

- (void)autoFillArcadeCabin:(NSString*)script
{
	NSString* nameValue = [name stringValue];
	if(nameValue == nil || [nameValue length] == 0) {
		NSRange start = [script rangeOfString:@"/tempswf/"];

		if(start.location != NSNotFound) {
			start.location += 9;
			NSRange end = [[script substringFromIndex:start.location] rangeOfString:@"\""];
			start.length = end.location;
			
			NSString* extracted = [script substringWithRange:start];
			if(extracted && [extracted length]) {
				[name setObjectValue:extracted];
			}
		}
	}
	
	NSString* idValue = [identifier stringValue];
	if(idValue == nil || [idValue length] == 0) {
		NSRange start = [script rangeOfString:@"/tempswf/"];

		if(start.location != NSNotFound) {
			start.location += 9;
			NSRange end = [[script substringFromIndex:start.location] rangeOfString:@"\""];
			start.length = end.location;
			
			NSString* extracted = [script substringWithRange:start];
			if(extracted && [extracted length]) {
				NSString* autoValue = [NSString stringWithFormat:@"com.arcadecabin.widget.%@", extracted];
				[identifier setObjectValue:autoValue];
			}
		}
	}
	
	eWidth = [self getAttribute:script pre:@"width=\"" post:@"\""];
	eHeight = [self getAttribute:script pre:@"height=\"" post:@"\""];
			
	padHeight = 28;

	[self selectMenuItem:tagArcadeCabin];
}

- (void)autoFillClockLink:(NSString*)script
{
	if([script hasPrefix:@"<script "]) {
		NSString* nameValue = [name stringValue];
		if(nameValue == nil || [nameValue length] == 0) {
			NSRange start = [script rangeOfString:@".swf"];

			if(start.location != NSNotFound) {
				NSRange end = [[script substringToIndex:start.location] rangeOfString:@"\"" options:NSBackwardsSearch];
				start.length = (start.location - end.location) - 1;
				start.location = end.location + 1;
				
				NSString* extracted = [script substringWithRange:start];
				if(extracted && [extracted length]) {
					[name setObjectValue:extracted];
				}	
			}
		}

		NSString* idValue = [identifier stringValue];
		if(idValue == nil || [idValue length] == 0) {
			NSRange start = [script rangeOfString:@".swf"];

			if(start.location != NSNotFound) {
				NSRange end = [[script substringToIndex:start.location] rangeOfString:@"\"" options:NSBackwardsSearch];
				start.length = (start.location - end.location) - 1;
				start.location = end.location + 1;
				
				NSString* extracted = [script substringWithRange:start];
				if(extracted && [extracted length]) {
					NSString* autoValue = nil;
					
					autoValue = [NSString stringWithFormat:@"com.clocklink.widget.%@", extracted];
						
					[identifier setObjectValue:autoValue];
				}
			}
		}
		
		eWidth = [self getAttribute:script pre:@"width = " post:@";"];
		eHeight = [self getAttribute:script pre:@"height = " post:@";"];
		
		[self selectMenuItem:tagClockLink];

		fullDrag = YES;
	}

	if([script hasPrefix:@"<embed "]) {
		NSString* nameValue = [name stringValue];
		if(nameValue == nil || [nameValue length] == 0) {
			NSRange start = [script rangeOfString:@".swf"];

			if(start.location != NSNotFound) {
				NSRange end = [[script substringToIndex:start.location] rangeOfString:@"/" options:NSBackwardsSearch];
				start.length = (start.location - end.location) - 1;
				start.location = end.location + 1;
				
				NSString* extracted = [script substringWithRange:start];
				if(extracted && [extracted length]) {
					[name setObjectValue:extracted];
				}	
			}
		}

		NSString* idValue = [identifier stringValue];
		if(idValue == nil || [idValue length] == 0) {
			NSRange start = [script rangeOfString:@".swf"];

			if(start.location != NSNotFound) {
				NSRange end = [[script substringToIndex:start.location] rangeOfString:@"/" options:NSBackwardsSearch];
				start.length = (start.location - end.location) - 1;
				start.location = end.location + 1;
				
				NSString* extracted = [script substringWithRange:start];
				if(extracted && [extracted length]) {
					NSString* autoValue = nil;
					
					autoValue = [NSString stringWithFormat:@"com.clocklink.widget.%@", extracted];
						
					[identifier setObjectValue:autoValue];
				}
			}
		}
		
		eWidth = [self getAttribute:script pre:@"width=\"" post:@"\""];
		eHeight = [self getAttribute:script pre:@"height=\"" post:@"\""];
		
		[self selectMenuItem:tagClockLink];
		
		fullDrag = YES;
	}
}

- (void)autoFillYouTube:(NSString*)script
{
	NSString* nameValue = [name stringValue];
	if(nameValue == nil || [nameValue length] == 0) {
		NSRange start = [script rangeOfString:@"/v/"];

		if(start.location != NSNotFound) {
			start.location += 3;
			NSRange end = [[script substringFromIndex:start.location] rangeOfString:@"\""];
			start.length = end.location;
			
			NSString* extracted = [script substringWithRange:start];
			if(extracted && [extracted length]) {
				[name setObjectValue:extracted];
			}	
		}
	}

	NSString* idValue = [identifier stringValue];
	if(idValue == nil || [idValue length] == 0) {
		NSRange start = [script rangeOfString:@"/v/"];

		if(start.location != NSNotFound) {
			start.location += 3;
			NSRange end = [[script substringFromIndex:start.location] rangeOfString:@"\""];
			start.length = end.location;
			
			NSString* extracted = [script substringWithRange:start];
			if(extracted && [extracted length]) {
				NSString* autoValue = [NSString stringWithFormat:@"com.youtube.widget.%@", extracted];
				[identifier setObjectValue:autoValue];
			}
		}
	}
	
	eWidth = [self getAttribute:script pre:@"width=\"" post:@"\""];		
	eHeight = [self getAttribute:script pre:@"height=\"" post:@"\""];
	
	[self selectMenuItem:tagYouTube];
}

- (BOOL)autoFillFlash:(NSString*)script withCreator:(NSString*)creator siteTitle:(NSString*)site hashMarker:(NSString*)marker
{
	if(creator || [script hasPrefix:@"<object "] || [script hasPrefix:@"<embed "]) {
		NSString* hashString = nil;
		
		int hash = 0;
		if(marker) {
			if([marker isEqualToString:@""]) {
				hash = [script hash];
			}
			else {
				NSRange start = [script rangeOfString:marker];

				if(start.location != NSNotFound) {
					start.location += [marker length];
					NSRange end = [[script substringFromIndex:start.location] rangeOfString:@"&"];
					if(end.location == NSNotFound)
						end = [[script substringFromIndex:start.location] rangeOfString:@"\""];
					if(end.location == NSNotFound)
						end = [[script substringFromIndex:start.location] rangeOfString:@"'"];

					if(end.location != NSNotFound) {
						start.length = end.location;
						
						NSString* extracted = [script substringWithRange:start];
						if(extracted && [extracted length]) {
							if([extracted length] <= 16)
								hashString = extracted;

							hash = [extracted hash];
						}
					}
				}
			}
		}
		
		NSString* nameValue = [name stringValue];
		if(nameValue == nil || [nameValue length] == 0) {
			if(hash) {
				NSString* autoValue = nil;
				
				if(hashString)
					autoValue = [NSString stringWithFormat:@"%@ %@", site, hashString];
				else
					autoValue = [NSString stringWithFormat:@"%@ %d", site, hash];
				
				[name setObjectValue:autoValue];
			}
			else {
				NSRange start = [script rangeOfString:@".swf"];

				if(start.location != NSNotFound) {
					NSRange end = [[script substringToIndex:start.location] rangeOfString:@"/" options:NSBackwardsSearch];					
					start.length = (start.location - end.location) - 1;
					start.location = end.location + 1;
					
					NSString* extracted = [script substringWithRange:start];
					if(extracted && [extracted length]) {
						[name setObjectValue:extracted];
					}	
				}
				else {
					hash = [script hash];
					NSString* autoValue = [NSString stringWithFormat:@"%@ %d", site, hash];
					[name setObjectValue:autoValue];
				}
			}
		}

		NSString* idValue = [identifier stringValue];
		if(idValue == nil || [idValue length] == 0) {
			if(hash) {
				NSString* autoValue = nil;
				
				if(hashString) {
					if(creator == nil)
						autoValue = [NSString stringWithFormat:@"com.adobe.widget.%@", hashString];
					else
						autoValue = [NSString stringWithFormat:@"%@.widget.%@", creator, hashString];
				}
				else {
					if(creator == nil)
						autoValue = [NSString stringWithFormat:@"com.adobe.widget.%d", hash];
					else
						autoValue = [NSString stringWithFormat:@"%@.widget.%d", creator, hash];
				}
				
				[identifier setObjectValue:autoValue];
			}
			else {
				NSRange start = [script rangeOfString:@".swf"];

				if(start.location != NSNotFound) {
					NSRange end = [[script substringToIndex:start.location] rangeOfString:@"/" options:NSBackwardsSearch];
					start.length = (start.location - end.location) - 1;
					start.location = end.location + 1;
					
					NSString* extracted = [script substringWithRange:start];
					if(extracted && [extracted length]) {
						NSString* autoValue = nil;
						
						if(creator == nil)
							autoValue = [NSString stringWithFormat:@"com.adobe.widget.%@", extracted];
						else
							autoValue = [NSString stringWithFormat:@"%@.widget.%@", creator, extracted];
							
						[identifier setObjectValue:autoValue];
					}
				}
			}
		}
			
		eWidth = [self getAttribute:script pre:@"width=\"" post:@"\""];
		if(eWidth == nil)
			eWidth = [self getAttribute:script pre:@"width='" post:@"'"];
		if(eWidth == nil)
			eWidth = [self getAttribute:script pre:@"width:" post:@";"];
				
		eHeight = [self getAttribute:script pre:@"height=\"" post:@"\""];
		if(eHeight == nil)
			eHeight = [self getAttribute:script pre:@"height='" post:@"'"];
		if(eHeight == nil)
			eHeight = [self getAttribute:script pre:@"height:" post:@";"];
		
		fullDrag = YES;
		return YES;
	}
	
	return NO;
}

- (void)readPreferences
{
	NSNumber* setting = nil;
	
	setting = (NSNumber*) CFPreferencesCopyAppValue(CFSTR("SaveReveal"), kCFPreferencesCurrentApplication);
	if(setting) {
		[saveReveal setState:[setting intValue]];
		CFRelease(setting);
	}
	
	setting = (NSNumber*) CFPreferencesCopyAppValue(CFSTR("SaveLaunch"), kCFPreferencesCurrentApplication);
	if(setting) {
		[saveLaunch setState:[setting intValue]];
		CFRelease(setting);
	}
		
	setting = (NSNumber*) CFPreferencesCopyAppValue(CFSTR("SaveWindowOnTop"), kCFPreferencesCurrentApplication);
	if(setting) {
		[saveWindowOnTop setState:[setting intValue]];
		CFRelease(setting);
	}
		
	setting = (NSNumber*) CFPreferencesCopyAppValue(CFSTR("SavePosition"), kCFPreferencesCurrentApplication);
	if(setting) {
		[saveWindowPosition setState:[setting intValue]];
		CFRelease(setting);
	}
		
	setting = (NSNumber*) CFPreferencesCopyAppValue(CFSTR("Library"), kCFPreferencesCurrentApplication);
	if(setting) {
		[self selectMenuItem:[setting intValue]];
		CFRelease(setting);
	}
	else
		[self selectMenuItem:tagGoogle];
		
	setting = (NSNumber*) CFPreferencesCopyAppValue(CFSTR("HelpWidth"), kCFPreferencesCurrentApplication);
	if(setting) {
		drawerWidth = [setting floatValue];
		CFRelease(setting);
	}
	else
		drawerWidth = 0.0;
		
	setting = (NSNumber*) CFPreferencesCopyAppValue(CFSTR("OriginX"), kCFPreferencesCurrentApplication);
	if(setting) {
		origin.x = [setting floatValue];
		CFRelease(setting);
	}
	else
		origin.x = 0.0;
		
	setting = (NSNumber*) CFPreferencesCopyAppValue(CFSTR("OriginY"), kCFPreferencesCurrentApplication);
	if(setting) {
		origin.y = [setting floatValue];
		CFRelease(setting);
	}
	else
		origin.y = 0.0;

	// 1.2
	NSString* userFolder = (NSString*) CFPreferencesCopyAppValue(CFSTR("UserWidgetFolder"), kCFPreferencesCurrentApplication);
	if(userFolder) {
		userWidgetFolder = [[NSString alloc] initWithString:userFolder];
	}
	else {
		userWidgetFolder = [[NSString alloc] initWithFormat:@"%@/Library/Widgets", NSHomeDirectory()];
		
		CFPreferencesSetAppValue(CFSTR("UserWidgetFolder"), userWidgetFolder, kCFPreferencesCurrentApplication);	
		CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
	}
}

- (void)writePreferences
{
	origin = [[self window] frame].origin;

	CFPreferencesSetAppValue(CFSTR("SaveReveal"), [NSNumber numberWithInt:[saveReveal state]], kCFPreferencesCurrentApplication);	
	CFPreferencesSetAppValue(CFSTR("SaveLaunch"), [NSNumber numberWithInt:[saveLaunch state]], kCFPreferencesCurrentApplication);	
	CFPreferencesSetAppValue(CFSTR("SaveWindowOnTop"), [NSNumber numberWithInt:[saveWindowOnTop state]], kCFPreferencesCurrentApplication);	
	CFPreferencesSetAppValue(CFSTR("SavePosition"), [NSNumber numberWithInt:[saveWindowPosition state]], kCFPreferencesCurrentApplication);	
	CFPreferencesSetAppValue(CFSTR("Library"), [NSNumber numberWithInt:[[library selectedItem] tag]], kCFPreferencesCurrentApplication);	
	CFPreferencesSetAppValue(CFSTR("HelpWidth"), [NSNumber numberWithFloat:drawerWidth], kCFPreferencesCurrentApplication);	
	CFPreferencesSetAppValue(CFSTR("OriginX"), [NSNumber numberWithFloat:origin.x], kCFPreferencesCurrentApplication);	
	CFPreferencesSetAppValue(CFSTR("OriginY"), [NSNumber numberWithFloat:origin.y], kCFPreferencesCurrentApplication);	

	CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
}

- (int)getWidgetVersion // hash
{
   	int base1 = 0;
	int base2 = 0;
	int base3 = 0;
	int base4 = 0;
	
	if(widgetData == nil)
		return 0;
		
	char* element = widgetData;
		
	while(*element) {
		int h = (int) (*element);
		
		base1 += h;
		element++;
		
		if(*element) {
			h = (int) (*element);
			
			base1 += h;
			base2 += h;
			element++;
		}
		
		if(*element) {
			h = (int) (*element);
			
			base1 += h;
			base3 += h;
			element++;
		}

		if(*element) {
			h = (int) (*element);
			
			base1 += h;
			base2 += h;
			element++;
		}

		if(*element) {
			h = (int) (*element);
			
			base1 += h;
			base4 += h;
			element++;
		}
		
		if(*element) {
			h = (int) (*element);
			
			base1 += h;
			base2 += h;
			base3 += h;
			element++;
		}
	}
	
	return (base1 + (base2 << 8) + (base3 << 16) + (base4 << 24));
}

// NSWindow delegate

// NSApplication delegate
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{	
	[[self window] center];

	if([saveWindowPosition state] == NSOnState) {
		if(NSEqualPoints(origin, NSMakePoint(0.0, 0.0)) == NO)
			[[self window] setFrameOrigin:origin];
	}
	
	if([saveWindowOnTop state] == NSOnState)
		[[self window] setLevel:NSStatusWindowLevel];
		
	[[self window] makeKeyAndOrderFront:self];
}

- (void)applicationWillTerminate:(NSNotification* )aNotification
{
	[self writePreferences];
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication
{
	return YES;
}

// NSDrawer delegate
- (void)drawerWillOpen:(NSNotification *)notification
{
	[self handleLibrary:self];
	
	if(openedDrawer == NO) {
		if(drawerWidth > 32.0) {
			NSDrawer* drawer = (NSDrawer*) [notification object];
			NSSize size = [drawer contentSize];
			size.width = drawerWidth;
			[drawer setContentSize:size];
		}
		
		openedDrawer = YES;
	}
}

- (NSSize)drawerWillResizeContents:(NSDrawer *)sender toSize:(NSSize)contentSize
{
	drawerWidth = contentSize.width;
	return contentSize;
}

@end
