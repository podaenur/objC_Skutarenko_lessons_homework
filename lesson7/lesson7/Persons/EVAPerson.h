//
//  EVAPerson.h
//  lesson5
//
//  Created by Eugeny on 21/06/15.
//  Copyright (c) 2015 Eugeny Akhmerov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, EVAPersonSex) {
  EVAPersonSexMan,
  EVAPersonSexWoman
};

NSString * NSStringFromEVAPersonSex(EVAPersonSex aSex);

@interface EVAPerson : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat weight;
@property (nonatomic, strong) NSString *sex;

+ (instancetype)createPersonWithName:(NSString *)aName height:(CGFloat)aHeight weight:(CGFloat)aWeight sex:(NSString *)aSex;

- (void)movement;
- (void)displaySelf;

@end