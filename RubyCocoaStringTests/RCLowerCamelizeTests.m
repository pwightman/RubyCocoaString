//
//  RCLowerCamelizeTests.m
//  RubyCocoaString
//
//  Created by Parker Wightman on 12/28/12.
//  Copyright (c) 2012 Parker Wightman Inc. All rights reserved.
//

#import "RCLowerCamelizeTests.h"
#import "NSString+RubyCocoaString.h"

@implementation RCLowerCamelizeTests

- (void) testLowerCamelizeOnStandardUseCase {
	STAssertTrue([[@"foo_bar" lowerCamelize] isEqualToString:@"fooBar"], @"lowerCamelize: foo_bar becomes fooBar");
}

@end
