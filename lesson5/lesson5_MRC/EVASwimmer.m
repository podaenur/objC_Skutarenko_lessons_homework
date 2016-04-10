//
//  EVASwimmer.m
//  lesson5
//
//  Created by Evgeniy Akhmerov on 10/04/16.
//  Copyright © 2016 Eugeny Akhmerov. All rights reserved.
//

#import "EVASwimmer.h"

@implementation EVASwimmer

- (instancetype)init {
  self = [super init];
  if (self) {
    self.name = @"Swimmer Vasya";
    self.height = 179.3f;
    self.weight = 83.12f;
    self.sex = 0;
  }
  return self;
}

- (void)moving {
  NSLog(@"Wow, I swimm...");
}

@end
