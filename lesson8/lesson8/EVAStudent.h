//
//  EVAStudent.h
//  lesson8
//
//  Created by Eugeny on 06/07/15.
//  Copyright (c) 2015 Eugeny Akhmerov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EVAStudent : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *greeting;

+ (instancetype)createStudentName:(NSString *)aName lastName:(NSString *)lastName andGreeting:(NSString *)aGreeting;

/**
 Pass numbers of objects which you need to return
 */
+ (NSArray *)generateRandomStudents:(NSUInteger)aCount;
@end
