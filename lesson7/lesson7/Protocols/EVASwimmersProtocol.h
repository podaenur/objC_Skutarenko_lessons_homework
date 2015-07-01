//
//  EVASwimmersProtocol.h
//  lesson7
//
//  Created by Eugeny on 30/06/15.
//  Copyright (c) 2015 Eugeny Akhmerov. All rights reserved.
//

#define Y_OR_N_STR(bool_arg) bool_arg == 0 ? @"NO" : bool_arg == 1 ? @"YES" : @"error unwrap"

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol EVASwimmersProtocol <NSObject>

@required
@property (nonatomic, assign) CGFloat speed;
@property (nonatomic, assign) BOOL underWaterSwim;

- (CGFloat)makeSwim;

@optional
- (void)makeScream;
@end