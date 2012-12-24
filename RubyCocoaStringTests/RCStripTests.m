//
//  RCStripTests.m
//  RubyCocoaString
//
//  Created by Parker Wightman on 12/24/12.
//  Copyright (c) 2012 Parker Wightman Inc. All rights reserved.
//

#import "RCStripTests.h"
#import "NSString+RubyCocoaString.h"

@implementation RCStripTests

- (void) testStripWhiteSpace {
	STAssertTrue([[@" \n\tfoo\n " strip] isEqualToString:@"foo"], @"strip: whitespace-surrounded foo should equal foo");
}

@end
