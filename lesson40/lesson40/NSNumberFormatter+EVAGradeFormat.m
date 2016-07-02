//
//  NSNumberFormatter+EVAGradeFormat.m
//  lesson40
//
//  Created by Evgeniy Akhmerov on 02/07/16.
//  Copyright © 2016 Evgeniy Akhmerov. All rights reserved.
//

@import UIKit;
#import "NSNumberFormatter+EVAGradeFormat.h"

@implementation NSNumberFormatter (EVAGradeFormat)

+ (NSString *)eva_gradeStringFromGrade:(CGFloat)grade {
    static NSNumberFormatter *formatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [[NSNumberFormatter alloc] init];
        
        formatter.numberStyle = NSNumberFormatterDecimalStyle;
        formatter.minimumIntegerDigits = 0;
        formatter.maximumIntegerDigits = 1;
        formatter.minimumFractionDigits = 0;
        formatter.maximumFractionDigits = 2;
    });
    return [formatter stringFromNumber:@(grade)];
}

@end
