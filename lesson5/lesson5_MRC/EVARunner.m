//
//  EVARunner.m
//  lesson5
//
//  Created by Evgeniy Akhmerov on 10/04/16.
//  Copyright © 2016 Eugeny Akhmerov. All rights reserved.
//

#import "EVARunner.h"

@implementation EVARunner

- (instancetype)init {
  self = [super init];
  if (self) {
    self.name = @"//|-/|\\-___=+";
    self.height = 242.1f;
    self.weight = 1002.99f;
    self.sex = INT_MAX;
  }
  return self;
}
- (void)moving {
  NSLog(@"My blaster comming to get you animal... OOOOOrrrhh.....");
}

@end
