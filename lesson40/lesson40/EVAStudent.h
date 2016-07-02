//
//  EVAStudent.h
//  lesson40
//
//  Created by Evgeniy Akhmerov on 02/07/16.
//  Copyright © 2016 Evgeniy Akhmerov. All rights reserved.
//

@import Foundation;
@import UIKit;

typedef NS_ENUM(NSUInteger, EVAGender) {
    EVAGenderMale,
    EVAGenderFemale
};

@interface EVAStudent : NSObject

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, strong) NSDate *dateOfBirth;
@property (nonatomic, assign) EVAGender gender;
@property (nonatomic, assign) CGFloat grade;

+ (instancetype)createStudentFirstName:(NSString *)firstName
                              lastName:(NSString *)lastName
                           dateOfBirth:(NSDate *)dateOfBirth
                                gender:(EVAGender)gender
                                 grade:(CGFloat)grade;

@end
