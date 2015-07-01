//
//  EVAMouse.m
//  lesson5
//
//  Created by Eugeny on 21/06/15.
//  Copyright (c) 2015 Eugeny Akhmerov. All rights reserved.
//

#import "EVAMouse.h"

@implementation EVAMouse

- (void)movement {
  [super movement];
  
  NSLog(@"Act with ball of cotton.\n");
}

#pragma mark - Protocol conformance
#pragma mark EVARunnersProtocol

@synthesize distance, raceType;

- (CGFloat)makeRun {
  if (self.raceType == EVARaceTypeSector) {
    return 4.3f;
  } else if (self.raceType == EVARaceTypeCircuit) {
    return 2.1f;
  } else {
    return 0.f;
  }
}

@end
