//
//  EVAStudent.h
//  lesson13
//
//  Created by Eugeny on 11/08/15.
//  Copyright (c) 2015 Eugeny Akhmerov. All rights reserved.
//

#import <Foundation/Foundation.h>

struct EVAPuzzle {
  NSInteger unknownNumber;
  NSInteger min;
  NSInteger max;
};
typedef struct EVAPuzzle EVAPuzzle;

static inline EVAPuzzle EVAPuzzleMake(NSInteger unknownNumber, NSInteger min, NSInteger max) {
  EVAPuzzle puzzle;
  puzzle.unknownNumber = unknownNumber;
  puzzle.min = min;
  puzzle.max = max;
  return puzzle;
}

@interface EVAStudent : NSObject

@property (nonatomic, copy) NSString *name;

- (void)guessAnswer:(EVAPuzzle)aPuzzle callback:(void(^)(NSString *name, NSInteger number))callback;
@end
