//
//  EVARunnersProtocol.h
//  lesson7
//
//  Created by Eugeny on 30/06/15.
//  Copyright (c) 2015 Eugeny Akhmerov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, EVARaceType) {
  EVARaceTypeCircuit,
  EVARaceTypeSector
};

@protocol EVARunnersProtocol <NSObject>

@required
@property (nonatomic, assign) CGFloat distance;
@property (nonatomic, assign) EVARaceType type;

- (CGFloat)makeRun;

@optional
- (void)makeTestRun;
@end