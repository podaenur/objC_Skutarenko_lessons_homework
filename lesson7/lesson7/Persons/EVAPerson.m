//
//  EVAPerson.m
//  lesson5
//
//  Created by Eugeny on 21/06/15.
//  Copyright (c) 2015 Eugeny Akhmerov. All rights reserved.
//

#import "EVAPerson.h"

@implementation EVAPerson

+ (instancetype)createPersonWithName:(NSString *)aName height:(CGFloat)aHeight weight:(CGFloat)aWeight sex:(NSString *)aSex {
  EVAPerson *person = [[self class] new];
  person.name = aName;
  person.height = aHeight;
  person.weight = aWeight;
  person.sex = aSex;
  return person;
}

- (void)movement {
  
}

- (void)displaySelf {
  NSLog(@"Name: %@\n"
        "Height: %.2f\n"
        "Weight: %.2f\n"
        "sex: %@", self.name, self.height, self.weight, self.sex);
}

@end
