//
//  AppDelegate.m
//  lesson5
//
//  Created by Eugeny on 21/06/15.
//  Copyright (c) 2015 Eugeny Akhmerov. All rights reserved.
//

#import "AppDelegate.h"
#import "EVASportsmen.h"
#import "EVAIdler.h"
#import "EVAPets.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark Life cycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  EVABicyclist *bicyclist = [EVABicyclist createPersonWithName:@"Julia" height:176.f weight:45.f sex:@"woman"];
  EVARunner *runner = [EVARunner createPersonWithName:@"Piter" height:181.f weight:93.f sex:@"man"];
  EVASwimmer *swimmer = [EVASwimmer createPersonWithName:@"Andrew" height:179.f weight:69.f sex:@"man"];
  
  EVAIdler *idler = [EVAIdler createPersonWithName:@"Nick" height:168.f weight:121.f sex:@"man"];
  idler.fatness = 96.f;
  idler.idleTimeInHours = 163.f;
  
  NSArray *sportsmen = @[ bicyclist, runner, swimmer ];
  sportsmen = [sportsmen arrayByAddingObjectsFromArray:@[ idler ]];
  
  EVADog *dog = [EVADog createAnimalWithNickname:@"Sharik" color:[UIColor brownColor]];
  EVAMouse *mouse = [EVAMouse createAnimalWithNickname:@"MauMau" color:[UIColor grayColor]];
  
  NSArray *units = [sportsmen arrayByAddingObjectsFromArray:@[ dog, mouse ]];
  
  NSUInteger count = sportsmen.count;
  for (NSUInteger step = count; step == 0; step--) {
    if ([sportsmen[step] isKindOfClass:[EVAPerson class]]) {
      [sportsmen[step] displaySelf];
      if ([sportsmen[step] respondsToSelector:@selector(displaySelfAdditionalInfo)]) {
        [sportsmen[step] displaySelfAdditionalInfo];
      }
      [sportsmen[step] movement];
      NSLog(@"\n");
    }
  }
  
  for (id obj in units) {
    if ([obj isKindOfClass:[EVAPerson class]]) {
      [obj displaySelf];
      if ([obj respondsToSelector:@selector(displaySelfAdditionalInfo)]) {
        [obj displaySelfAdditionalInfo];
      }
      [obj movement];
      NSLog(@"\n");
    } else if ([obj isKindOfClass:[EVAAnimal class]]) {
      [obj displaySelf];
      [obj movement];
    }
  }
  
  NSArray *people = @[ bicyclist, runner, swimmer, idler ];
  NSArray *pets = @[ dog, mouse ];
  
  NSUInteger peopleCount = people.count;
  NSUInteger petsCount = pets.count;
  NSUInteger count2 = MAX(peopleCount, petsCount);
  for (NSUInteger step = 0; step < count2; step++) {
    if (step < peopleCount) {
      [people[step] displaySelf];
    }
    if (step < petsCount) {
      [pets[step] displaySelf];
    }
  }
  
  NSArray *unsortedUnits = @[ swimmer, dog, bicyclist, runner, mouse, idler ];
  
  NSArray *sorted = [unsortedUnits sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
    if ([obj1 isKindOfClass:[EVAPerson class]] && [obj2 isKindOfClass:[EVAAnimal class]]) {
      return NSOrderedAscending;
    } else if ([obj2 isKindOfClass:[EVAPerson class]] && [obj1 isKindOfClass:[EVAAnimal class]]) {
      return NSOrderedDescending;
    } else {
      return [[self returnName:obj1] compare:[self returnName:obj2]];
    }
  }];
  
  for (id obj in sorted) {
    if ([obj isKindOfClass:[EVAPerson class]]) {
      NSLog(@"name: %@\n", [(EVAPerson *)obj name]);
    } else if ([obj isKindOfClass:[EVAAnimal class]]) {
      NSLog(@"nickname: %@\n", [(EVAAnimal *)obj nickname]);
    }
  }
  
  
  
  return YES;
}

#pragma mark - Private methods

- (NSString *)returnName:(id)obj {
  if ([obj isKindOfClass:[EVAPerson class]]) {
    return [(EVAPerson *)obj name];
  } else if ([obj isKindOfClass:[EVAAnimal class]]) {
    return [(EVAAnimal *)obj nickname];
  } else {
    return nil;
  }
}

@end