//
//  EVARunner.m
//  lesson5
//
//  Created by Eugeny on 21/06/15.
//  Copyright (c) 2015 Eugeny Akhmerov. All rights reserved.
//

#import "EVARunner.h"

@implementation EVARunner

- (void)movement {
  [super movement];
  
  NSLog(@"I will should not confused in the legs!\n");
}

#pragma mark - Protocol conformance
#pragma mark EVARunnersProtocol

@synthesize distance, raceType;

- (CGFloat)makeRun {
  return 15.2f;
}

- (void)makeTestRun {
  NSLog(@"Yearr... I can run for free!..");
}

#pragma mark EVAJumpersProtocol

@synthesize weight;

- (CGFloat)makeJump {
  return 7.1f;
}

@end
