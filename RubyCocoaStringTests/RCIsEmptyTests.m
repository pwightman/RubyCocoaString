//
//  RCIsEmptyTests.m
//  RubyCocoaString
//
//  Created by Parker Wightman on 12/24/12.
//  Copyright (c) 2012 Parker Wightman Inc. All rights reserved.
//

#import "RCIsEmptyTests.h"
#import "NSString+RubyCocoaString.h"

@implementation RCIsEmptyTests

- (void) testIsEmptyWithEmptyString {
	STAssertTrue([@"" isEmpty], @"isEmpty: \"\" should be empty.");
}

- (void) testIsEmptyWithWhiteSpace {
	STAssertFalse([@" " isEmpty], @"isEmpty: \" \" should not be empty");
}

- (void) testIsEmptyWithNonWhitSpace {
	STAssertFalse([@"hi" isEmpty], @"isEmpty: \"hi\" should not be empty");
}

@end
