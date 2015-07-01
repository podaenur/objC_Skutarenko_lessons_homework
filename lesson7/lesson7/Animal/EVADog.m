//
//  EVADog.m
//  lesson5
//
//  Created by Eugeny on 21/06/15.
//  Copyright (c) 2015 Eugeny Akhmerov. All rights reserved.
//

#import "EVADog.h"

@implementation EVADog

- (void)movement {
  [super movement];
  
  NSLog(@"Act with stick.\n");
}

#pragma mark - Protocol conformance
#pragma mark EVAJumpers

@synthesize weight;

- (CGFloat)makeJump {
  return (arc4random()%5 + (arc4random()%10) / 10);
}

@end
