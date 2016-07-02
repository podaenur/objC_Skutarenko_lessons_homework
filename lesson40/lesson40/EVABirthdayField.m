//
//  EVABirthdayField.m
//  lesson40
//
//  Created by Evgeniy Akhmerov on 02/07/16.
//  Copyright © 2016 Evgeniy Akhmerov. All rights reserved.
//

#define TWO_CENTURY 200 * 365 * 24 * 60 * 60

#import "EVABirthdayField.h"

@interface EVABirthdayField () <UITextFieldDelegate>

@property (nonatomic, strong) UIDatePicker *datePicker;
@property (nonatomic, strong) NSDateFormatter *formatter;

@end

@implementation EVABirthdayField

#pragma mark - Life cycle

#pragma mark - Custom Accessors

- (UIView *)inputView {
    return self.datePicker;
}

- (UIDatePicker *)datePicker {
    if (!_datePicker) {
        _datePicker = [[UIDatePicker alloc] init];
        _datePicker.datePickerMode = UIDatePickerModeDate;
        NSDate *now = [NSDate date];
        _datePicker.minimumDate = [now dateByAddingTimeInterval:-TWO_CENTURY];
        _datePicker.maximumDate = now;
        
        [_datePicker addTarget:self action:@selector(onDatePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
        
        if (self.currentDate) {
            [_datePicker setDate:self.currentDate animated:YES];
        }
    }
    return _datePicker;
}

#pragma mark - Actions

- (void)onDatePickerValueChanged:(UIDatePicker *)sender {
    self.text = [self.formatter stringFromDate:sender.date];
    [self sendActionsForControlEvents:UIControlEventEditingChanged];
}

#pragma mark - Public

- (void)setCurrentDate:(NSDate *)date {
    [self.datePicker setDate:date animated:YES];
    self.text = [self.formatter stringFromDate:date];
}

- (NSDate *)currentDate {
    return self.datePicker.date;
}

#pragma mark - Private

- (BOOL)isEditing {
    return NO;
}

#pragma mark - Segue
#pragma mark - Animations

#pragma mark - Protocol conformance
#pragma mark EVAAbstractFieldConfigurable

- (void)setup {
    self.delegate = self;
    self.tintColor = [UIColor clearColor];
    
    self.formatter = [[NSDateFormatter alloc] init];
    [self.formatter setDateFormat:@"MMMM / dd / yyyy"];
}

#pragma mark - Notifications handlers
#pragma mark - Gestures handlers
#pragma mark - KVO
#pragma mark - NSCopying
#pragma mark - NSObject

@end
