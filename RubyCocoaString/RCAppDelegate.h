//
//  RCAppDelegate.h
//  RubyCocoaString
//
//  Created by Parker Wightman on 12/21/12.
//  Copyright (c) 2012 Parker Wightman Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RCAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
