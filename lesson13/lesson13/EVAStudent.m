//
//  EVAStudent.m
//  lesson13
//
//  Created by Eugeny on 11/08/15.
//  Copyright (c) 2015 Eugeny Akhmerov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EVAStudent.h"

@implementation EVAStudent

#pragma mark - Life cycle
#pragma mark - Custom Accessors
#pragma mark - Actions

#pragma mark - Public

- (void)guessAnswer:(EVAPuzzle)aPuzzle callback:(void(^)(NSString *name, NSInteger number))callback {
  __weak EVAStudent *weakSelf = self;
  
//  dispatch_queue_t studentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
  dispatch_queue_t studentQueue = [EVAStudent getStudentQueue];
  dispatch_async(studentQueue, ^{
    NSInteger currentNumber = 0;
    do {
      currentNumber = (NSInteger)(arc4random()%(aPuzzle.max - aPuzzle.min)) + aPuzzle.min;
    } while (currentNumber != aPuzzle.unknownNumber);
    
    dispatch_async(dispatch_get_main_queue(), ^{
#warning TODO: почему не работает слабая ссылка ????
      callback(self.name, currentNumber);
    });
  });
}

#pragma mark - Private

+ (dispatch_queue_t)getStudentQueue {
  static dispatch_queue_t studentQueue = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    studentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
  });
  return studentQueue;
}

#pragma mark Segue
#pragma mark Animations
#pragma mark - Protocol conformance
#pragma mark - Notifications handlers
#pragma mark - Gestures handlers
#pragma mark - KVO
#pragma mark - NSCopying
#pragma mark - NSObject

@end
