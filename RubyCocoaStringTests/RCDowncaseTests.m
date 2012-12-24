//
//  RCDowncaseTests.m
//  RubyCocoaString
//
//  Created by Parker Wightman on 12/24/12.
//  Copyright (c) 2012 Parker Wightman Inc. All rights reserved.
//

#import "RCDowncaseTests.h"
#import "NSString+RubyCocoaString.h"

@implementation RCDowncaseTests

- (void) testDowncaseWithUppercaseString {
	STAssertTrue([[@"FOO" downcase] isEqualToString:@"foo"], @"downcase: FOO should be foo");
}

@end
