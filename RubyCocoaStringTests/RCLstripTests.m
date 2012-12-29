//
//  RCLstripTests.m
//  RubyCocoaString
//
//  Created by Parker Wightman on 12/28/12.
//  Copyright (c) 2012 Parker Wightman Inc. All rights reserved.
//

#import "RCLstripTests.h"
#import "NSString+RubyCocoaString.h"

@implementation RCLstripTests

- (void) testLstripRemovesLeftWhitespace {
	STAssertTrue([[@"   foo   " lstrip] isEqualToString:@"foo   "], @"lstrip: removes left whitespace");
}

- (void) testLstripWithMulilineString {
	STAssertTrue([[@"    foo  \n\n   foo  " lstrip] isEqualToString:@"foo  \n\n   foo  "], @"lstrip: only remove whitespace from beginning of string, not beginning of every line.");
}

@end
