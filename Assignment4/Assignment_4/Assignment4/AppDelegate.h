//
//  AppDelegate.h
//  Assignment4
//
//  Created by Varshesh on 3/19/19.
//  Copyright © 2019 Varshesh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

