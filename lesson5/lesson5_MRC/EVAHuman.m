//
//  EVAHuman.m
//  lesson5
//
//  Created by Evgeniy Akhmerov on 10/04/16.
//  Copyright © 2016 Eugeny Akhmerov. All rights reserved.
//

#import "EVAHuman.h"

NSString *NSStringFromSex(int sexIndex) {
  if (sexIndex == 0) {
    return @"male";
  } else if (sexIndex == 1) {
    return @"female";
  }
  return @"alien";
}

@implementation EVAHuman

- (NSString *)description {
  return [NSString stringWithFormat:@"I'm %@ and %f height. My weight is %f and I'm %@.", self.name, self.height, self.weight, NSStringFromSex(self.sex)];
}

- (void)moving {
  // just to override
}

@end
