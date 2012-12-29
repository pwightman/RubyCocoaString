//
//  RCRstripTests.m
//  RubyCocoaString
//
//  Created by Parker Wightman on 12/28/12.
//  Copyright (c) 2012 Parker Wightman Inc. All rights reserved.
//

#import "RCRstripTests.h"
#import "NSString+RubyCocoaString.h"

@implementation RCRstripTests

- (void) testRstripRemovesLeftWhitespace {
	STAssertTrue([[@"   foo   " rstrip] isEqualToString:@"   foo"], @"rstrip: removes right whitespace");
}

- (void) testLstripWithMulilineString {
	STAssertTrue([[@"    foo  \n\n   foo  " rstrip] isEqualToString:@"    foo  \n\n   foo"], @"rstrip: only remove whitespace from end of string, not end of every line.");
}


@end
