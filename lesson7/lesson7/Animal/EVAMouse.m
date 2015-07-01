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

@synthesize distance, type;

- (CGFloat)makeRun {
  return (self.type == EVARaceTypeSector) ? 4.3f : 2.1f;
}

@end
