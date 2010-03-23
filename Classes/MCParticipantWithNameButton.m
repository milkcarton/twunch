//
//  MCParticipantWithNameButton.m
//  Twunch
//
//  Created by Jelle Vandebeeck on 26/08/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import "MCParticipantWithNameButton.h"

@implementation MCParticipantWithNameButton

@synthesize participant;

static UIFont *nameFont = nil;
static UIColor *grayColor = nil;

+ (void)initialize {
	if (self == [MCParticipantWithNameButton class]) {
		nameFont = [[UIFont fontWithName:@"AmericanTypewriter" size:20] retain];
		grayColor = [UIColor colorWithRed:.859 green:.859 blue:.855 alpha:1.0];
	}
}

#pragma mark Overridden methods

- (void)drawRect:(CGRect)rectangle {
	[grayColor set];	
	[participant.twitterName drawAtPoint:CGPointMake(50, 10) withFont:nameFont];
	[[UIImage imageNamed:@"detail-participant-highlighted.png"] drawInRect:CGRectMake(0, 0, rectangle.size.width, rectangle.size.height)];
}

#pragma mark Personal methods

- (void)setParticipant:(MCParticipant *)myParticipant  {
	participant = myParticipant;
	[self setNeedsDisplay]; 
}

+ (CGSize)sizeForParticipant:(MCParticipant *)myParticipant {
	CGSize size = [myParticipant.twitterName sizeWithFont:nameFont];
	size.width = size.width + 60;
	size.height = 40;
	return size;
}

+ (CGSize)sizeForTwunch:(MCTwunch *)twunch {
	return CGSizeMake(0, 0);
}

@end
