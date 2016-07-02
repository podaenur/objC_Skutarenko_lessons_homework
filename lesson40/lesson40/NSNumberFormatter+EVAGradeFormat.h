//
//  NSNumberFormatter+EVAGradeFormat.h
//  lesson40
//
//  Created by Evgeniy Akhmerov on 02/07/16.
//  Copyright © 2016 Evgeniy Akhmerov. All rights reserved.
//

@import Foundation;

@interface NSNumberFormatter (EVAGradeFormat)

+ (NSString *)eva_gradeStringFromGrade:(CGFloat)grade;

@end
