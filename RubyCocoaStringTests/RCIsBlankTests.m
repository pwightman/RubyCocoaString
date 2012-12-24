//
//  RCIsBlankTests.m
//  RubyCocoaString
//
//  Created by Parker Wightman on 12/24/12.
//  Copyright (c) 2012 Parker Wightman Inc. All rights reserved.
//

#import "RCIsBlankTests.h"
#import "NSString+RubyCocoaString.h"

@implementation RCIsBlankTests

- (void) testIsBlankWithEmptyString {
	STAssertTrue([@"" isBlank], @"isBlank: \"\" should be blank");
}

- (void) testIsBlankWithWhiteSpaceString {
	STAssertTrue([@" \n\t" isBlank], @"isBlank: \" \\n\\t\" should be blank");
}

- (void) testIsBlankWithNonWhiteSpaceString {
	STAssertFalse([@"hi " isBlank], @"isBlank: \"hi \" should not be blank");
}

@end
