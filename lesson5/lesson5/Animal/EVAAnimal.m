//
//  EVAAnimal.m
//  lesson5
//
//  Created by Eugeny on 21/06/15.
//  Copyright (c) 2015 Eugeny Akhmerov. All rights reserved.
//

#import "EVAAnimal.h"

@implementation EVAAnimal

+ (instancetype)createAnimalWithNickname:(NSString *)aNickname color:(UIColor *)aColor {
  EVAAnimal *animal = [[self class] new];
  animal.nickname = aNickname;
  animal.color = aColor;
  return animal;
}

- (void)movement {
  
}

- (void)displaySelf {
  NSLog(@"Nickname: %@\n", self.nickname);
}

@end
