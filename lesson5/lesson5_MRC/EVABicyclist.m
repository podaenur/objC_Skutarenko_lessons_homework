//
//  EVABicyclist.m
//  lesson5
//
//  Created by Evgeniy Akhmerov on 10/04/16.
//  Copyright © 2016 Eugeny Akhmerov. All rights reserved.
//

#import "EVABicyclist.h"

@implementation EVABicyclist

- (instancetype)init {
  self = [super init];
  if (self) {
    self.name = @"Bicyclist Anya";
    self.height = 163.f;
    self.weight = 45.54f;
    self.sex = 1;

  }
  return self;
}

- (void)moving {
  NSLog(@"Just rotating my pedals...");
}

@end
