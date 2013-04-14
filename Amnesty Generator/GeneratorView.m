//
//  GeneratorView.m
//  Amnesty Generator
//
//  Created by Danny Espinoza on 8/9/06.
//  Copyright 2006 Mesa Dynamics, LLC. All rights reserved.
//

#import "GeneratorView.h"

@implementation GeneratorView

- (void)drawRect:(NSRect)rect
{
    NSColor* c1 = [NSColor colorWithCalibratedWhite:.90 alpha:1.0];
    NSColor* c2 = [NSColor colorWithCalibratedWhite:.95 alpha:1.0];
    NSGradient* normalGradient = [[NSGradient alloc] initWithStartingColor:c1 endingColor:c2];
    [normalGradient drawInRect:[self frame] angle:90.0];
}

- (BOOL)isOpaque
{
	return NO;
}

@end
