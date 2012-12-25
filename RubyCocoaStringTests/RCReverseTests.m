//
//  RCReverseTests.m
//  RubyCocoaString
//
//  Created by Parker Wightman on 12/24/12.
//  Copyright (c) 2012 Parker Wightman Inc. All rights reserved.
//

#import "RCReverseTests.h"
#import "NSString+RubyCocoaString.h"

@implementation RCReverseTests

- (void) testReverse {
	STAssertTrue([[@"foobar" reverse] isEqualToString:@"raboof"], @"reverse: foobar should be raboof");
}

- (void) testReverseOnEmptyString {
	STAssertTrue([[@"" reverse] isEqualToString:@""], @"reverse: foobar should be raboof");
}

@end
