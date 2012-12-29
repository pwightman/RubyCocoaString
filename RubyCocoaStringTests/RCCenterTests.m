//
//  RCCenterTests.m
//  RubyCocoaString
//
//  Created by Parker Wightman on 12/28/12.
//  Copyright (c) 2012 Parker Wightman Inc. All rights reserved.
//

#import "RCCenterTests.h"
#import "NSString+RubyCocoaString.h"

@implementation RCCenterTests

- (void) testCenterWithWidthSmallerThanString {
	STAssertTrue([[@"foo" center:0] isEqualToString:@"foo"], @"center: \"foo\" is still \"foo\"");
}

- (void) testCenterWithEvenWidthEvenString {
	STAssertTrue([[@"fooo" center:8] isEqualToString:@"  fooo  "], @"center: \"foo\" becomes \"  foo  \"");
}

- (void) testCenterWithEvenWidthOddString {
	STAssertTrue([[@"foo" center:8] isEqualToString:@"  foo   "], @"center: \"foo\" becomes \"  foo   \"");
}

- (void) testCenterWithPadString {
	STAssertTrue([[@"foo" center:8 padString:@"123"] isEqualToString:@"12foo123"], @"center:PadString: \"foo\" becomes \"12foo123\"");
}

@end
