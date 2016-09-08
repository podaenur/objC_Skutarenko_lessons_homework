//
//  AppDelegate.m
//  lesson7
//
//  Created by Eugeny on 30/06/15.
//  Copyright (c) 2015 Eugeny Akhmerov. All rights reserved.
//

#define SEPARATE_LOG NSLog(@"______\n")

#import "AppDelegate.h"
#import "EVAPets.h"
#import "EVASportsmen.h"
#import "EVAIdler.h"
#import "EVAJumpersProtocol.h"
#import "EVASwimmersProtocol.h"
#import "EVARunnersProtocol.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  EVADog *dog =     [EVADog   createAnimalWithNickname:@"Chaki" color:[UIColor brownColor]];
  EVAMouse *mouse = [EVAMouse createAnimalWithNickname:@"Pipi"  color:[UIColor grayColor]];
  
  EVABicyclist *bicyclist = [EVABicyclist createPersonWithName:@"Victor"  height:178.f weight:87.f  sex:NSStringFromEVAPersonSex(EVAPersonSexMan)];
  EVARunner *runner =       [EVARunner    createPersonWithName:@"Ulya"    height:167.f weight:46.f  sex:NSStringFromEVAPersonSex(EVAPersonSexWoman)];
  EVASwimmer *swimmer =     [EVASwimmer   createPersonWithName:@"Olesya"  height:171.f weight:48.f  sex:NSStringFromEVAPersonSex(EVAPersonSexWoman)];
  EVAIdler *idler =         [EVAIdler     createPersonWithName:@"Uasya"   height:163.f weight:101.f sex:NSStringFromEVAPersonSex(EVAPersonSexMan)];
  
  NSArray *group = @[ swimmer, dog, runner, idler, mouse, bicyclist ];
  
  [group enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    [self letActionForCreature:obj];
  }];
  
  return YES;
}

#pragma mark - Private methods

- (void)letActionForCreature:(id)aCreature {
  if ([aCreature respondsToSelector:@selector(displaySelf)]) {
    [aCreature displaySelf];
  }
  
  if ([aCreature respondsToSelector:@selector(movement)]) {
    [aCreature movement];
  }
  
  if ([aCreature conformsToProtocol:@protocol(EVAJumpersProtocol)]) {
    NSLog(@"weight: %.2f | jump height: %.2f\n", [aCreature weight], [aCreature makeJump]);
    if ([aCreature respondsToSelector:@selector(eatCake)]) {
      [aCreature eatCake];
    }
  }
  
  if ([aCreature conformsToProtocol:@protocol(EVASwimmersProtocol)]) {
    NSLog(@"speed: %.2f\n"
          "can underwater swim: %@\n", [aCreature speed], Y_OR_N_STR([aCreature underWaterSwim]));
    NSLog(@"swim speed: %.2f\n", [aCreature makeSwim]);
    if ([aCreature respondsToSelector:@selector(makeScream)]) {
      [aCreature makeScream];
    }
  }
  
  if ([aCreature conformsToProtocol:@protocol(EVARunnersProtocol)]) {
    NSLog(@"distance to run: %.2f | race: %@\n", [aCreature distance], [self stringFromEVARaceType:[aCreature raceType]]);
    NSLog(@"run: %.2f\n", [aCreature makeRun]);
    
    if ([aCreature respondsToSelector:@selector(makeTestRun)]) {
      [aCreature makeTestRun];
    }
  }
  
  SEPARATE_LOG;
}

- (NSString *)stringFromEVARaceType:(EVARaceType)aType {
  switch (aType) {
    case EVARaceTypeCircuit: return @"Circuit"; break;
    case EVARaceTypeSector: return @"Sector"; break;
    default: return nil; break;
  }
}

@end
