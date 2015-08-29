//
//  EVAAnotherStudent.m
//  lesson13
//
//  Created by Eugeny on 14/08/15.
//  Copyright (c) 2015 Eugeny Akhmerov. All rights reserved.
//

#import "EVAAnotherStudent.h"

@implementation EVAAnotherStudent

#pragma mark - Life cycle
#pragma mark - Custom Accessors
#pragma mark - Actions

#pragma mark - Public

- (void)guessAnswer:(EVAPuzzle)aPuzzle callback:(void(^)(NSString *name, NSInteger number))callback {
  NSOperationQueue *queue = [NSOperationQueue new];
  
  [queue addOperationWithBlock:^{
    NSInteger currentNumber = 0;
    do {
      currentNumber = (NSInteger)(arc4random()%(aPuzzle.max - aPuzzle.min)) + aPuzzle.min;
    } while (currentNumber != aPuzzle.unknownNumber);
    callback(self.name, currentNumber);
  }];
}

#pragma mark - Private
#pragma mark Segue
#pragma mark Animations
#pragma mark - Protocol conformance
#pragma mark - Notifications handlers
#pragma mark - Gestures handlers
#pragma mark - KVO
#pragma mark - NSCopying
#pragma mark - NSObject

@end
