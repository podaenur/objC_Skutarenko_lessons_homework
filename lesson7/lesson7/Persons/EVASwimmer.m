//
//  EVASwimmer.m
//  lesson5
//
//  Created by Eugeny on 21/06/15.
//  Copyright (c) 2015 Eugeny Akhmerov. All rights reserved.
//

#import "EVASwimmer.h"

@implementation EVASwimmer

- (void)movement {
  [super movement];
  
  NSLog(@"Water is the best environment to sport.\n");
}

#pragma mark - Protocol conformance
#pragma mark EVASwimmersProtocol

@synthesize speed, underWaterSwim;

- (CGFloat)makeSwim {
  return 1.2f;
}

@end
