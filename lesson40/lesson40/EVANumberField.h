//
//  EVANumberField.h
//  lesson40
//
//  Created by Evgeniy Akhmerov on 02/07/16.
//  Copyright © 2016 Evgeniy Akhmerov. All rights reserved.
//

#import "EVAAbstractField.h"

@interface EVANumberField : EVAAbstractField

- (void)setGradeValue:(CGFloat)grade;
- (CGFloat)gradeValue;

@end
