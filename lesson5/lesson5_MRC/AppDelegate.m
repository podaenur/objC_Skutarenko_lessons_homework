//
//  AppDelegate.m
//  lesson5_MRC
//
//  Created by Evgeniy Akhmerov on 10/04/16.
//  Copyright © 2016 Eugeny Akhmerov. All rights reserved.
//

#import "AppDelegate.h"
#import "EVAHuman.h"
#import "EVARunner.h"
#import "EVASwimmer.h"
#import "EVABicyclist.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  EVARunner *runner = [[EVARunner alloc] init];
  EVASwimmer *swimmer = [[EVASwimmer alloc] init];
  EVABicyclist *bicyclist = [[EVABicyclist alloc] init];
  
  NSArray *humans = @[ runner, swimmer, bicyclist ];
  
  for (EVAHuman *h in humans) {
    NSLog(@"%@", h.description);
    [h moving];
  }
  
  [runner release];
  [swimmer release];
  [bicyclist release];
  
  return YES;
}

@end
