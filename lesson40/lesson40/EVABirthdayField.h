//
//  EVABirthdayField.h
//  lesson40
//
//  Created by Evgeniy Akhmerov on 02/07/16.
//  Copyright © 2016 Evgeniy Akhmerov. All rights reserved.
//

#import "EVAAbstractField.h"

@interface EVABirthdayField : EVAAbstractField

- (void)setCurrentDate:(NSDate *)date;
- (NSDate *)currentDate;

@end
