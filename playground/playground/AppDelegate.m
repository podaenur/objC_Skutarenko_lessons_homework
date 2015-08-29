//
//  AppDelegate.m
//  playground
//
//  Created by Eugeny on 27/08/15.
//  Copyright (c) 2015 Eugeny Akhmerov. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  
  
  CFIndex index = 2;
  char elements[2] = {'a', 'b'};
  CFArrayCallBacks callBacks;
  
  CFArrayRef someArray = CFArrayCreate(kCFAllocatorDefault, *elements, index, &callBacks);
  
  
  return YES;
}

@end
