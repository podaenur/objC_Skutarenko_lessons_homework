//
//  EVAJumpersProtocol.h
//  lesson7
//
//  Created by Eugeny on 30/06/15.
//  Copyright (c) 2015 Eugeny Akhmerov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol EVAJumpersProtocol <NSObject>

@required
@property (nonatomic, assign) CGFloat weight;

- (CGFloat)makeJump;

@optional
- (void)eatCake;
@end