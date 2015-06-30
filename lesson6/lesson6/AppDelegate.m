//
//  AppDelegate.m
//  lesson6
//
//  Created by Eugeny on 21/06/15.
//  Copyright (c) 2015 Eugeny Akhmerov. All rights reserved.
//

#import "AppDelegate.h"

typedef NS_ENUM(NSInteger, EVARectPosition) {
  EVARectPositionPointZero    = 0,
  EVARectPositionPointCenter  = 5,
  EVARectPositionPointLast    = 10
};

@interface AppDelegate ()

@property (nonatomic, assign) EVARectPosition centerPosition;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  self.centerPosition = EVARectPositionPointCenter;
  
  NSMutableSet *points = [NSMutableSet set];
  
  CGRect field = CGRectMake(EVARectPositionPointZero, EVARectPositionPointZero, EVARectPositionPointLast, EVARectPositionPointLast);
  CGFloat square = (CGRectGetWidth(field) - CGRectGetMinX(field)) * (CGRectGetHeight(field) - CGRectGetMinY(field));
  
  NSInteger iterations = arc4random()%(NSInteger)(square - square / 3);
  
  for (NSInteger step = 0; step < iterations; step++) {
    NSInteger x = arc4random()%(NSInteger)CGRectGetWidth(field);
    NSInteger y = arc4random()%(NSInteger)CGRectGetHeight(field);
    [points addObject:[NSValue valueWithCGPoint:CGPointMake(x, y)]];
  }
  
  NSLog(@"We generated %d points.\n", points.count);
  
  NSNumber *delta = @(2.f);
  
  CGPoint pointForRect = CGPointMake(_centerPosition - [delta doubleValue], _centerPosition - [delta doubleValue]);
  CGSize sizeForRect = CGSizeMake(3.f, 3.f);
  CGRect goalRect = CGRectMake(pointForRect.x, pointForRect.y, sizeForRect.width, sizeForRect.height);
  
  for (NSValue *some in points) {
    CGPoint currentPoint = [some CGPointValue];
    if (CGRectContainsPoint(goalRect, currentPoint)) {
      NSLog(@"Point %@ in goalRect\n", NSStringFromCGPoint(currentPoint));
    }
  }
  
  return YES;
}

@end
