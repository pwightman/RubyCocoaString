//
//  RCIncludesTests.m
//  RubyCocoaString
//
//  Created by Andrew Halls on 5/22/13.
//  Copyright (c) 2013 Parker Wightman Inc. All rights reserved.
//

#import "RCIncludesTests.h"
#import "NSString+RubyCocoaString.h"

@implementation RCIncludesTests

- (void) testIncludesWithFound {
	STAssertTrue([@"foo bar" includes:@"foo"], @"includes: \"foo bar\" includes \"foo\"");
}

- (void) testIncludesWithUpperCaseFound {
	STAssertTrue([@"fOO bar" includes:@"OO"], @"includes: \"fOO bar\" includes \"OO\", upper case");
}

- (void) testIncludesWithMixedUpCaseNotFound {
    STAssertFalse([@"foo bar" includes:@"OO"], @"includes: \"fOO bar\" not includes \"OO\", Mixed up cases");
}

- (void) testIncludesWithDuplicateStrings {
    STAssertTrue([@"foo barbar" includes:@"bar"], @"includes: \"foo barbar\" includes \"bar\"");
}

@end
