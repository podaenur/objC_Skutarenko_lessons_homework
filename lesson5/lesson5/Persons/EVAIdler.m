//
//  EVAIdler.m
//  lesson5
//
//  Created by Eugeny on 21/06/15.
//  Copyright (c) 2015 Eugeny Akhmerov. All rights reserved.
//

#import "EVAIdler.h"

@implementation EVAIdler

- (void)displaySelfAdditionalInfo {
  NSLog(@"Fatness: %.2f\n"
        "Idle time in hours: %.2f\n", self.fatness, self.idleTimeInHours);
}

@end
