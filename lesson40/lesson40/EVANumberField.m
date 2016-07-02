//
//  EVANumberField.m
//  lesson40
//
//  Created by Evgeniy Akhmerov on 02/07/16.
//  Copyright © 2016 Evgeniy Akhmerov. All rights reserved.
//

#import "EVANumberField.h"

//  0
//  0,
//  0.
//  0,0
//  0.0
//  0,00
//  0.00

static NSString *const EVANumberFieldRegexPattern = @
"^"             //  начало строки
"\\d"           //  только одна цифра
"("             //  выделение группы
"[\\,\\.]"      //  либо точка либо запятая
"\\d{0,2}"      //  только цифры от 0 до 2-х
")"             //  конец выделения группы
"?"             //  может быть значение, а может не быть значения (один символ) - действует для предыдущей группы
"$";            //  конец строки

@interface EVANumberField () <UITextFieldDelegate>

@end

@implementation EVANumberField

#pragma mark - Life cycle

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

#pragma mark - Custom Accessors
#pragma mark - Actions
#pragma mark - Public

#pragma mark - Private

- (void)setup {
    self.delegate = self;
}

#pragma mark - Segue
#pragma mark - Animations

#pragma mark - Protocol conformance
#pragma mark UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *fullString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:EVANumberFieldRegexPattern
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:nil];
    NSUInteger matches = [regex numberOfMatchesInString:fullString
                                                options:NSMatchingReportCompletion
                                                  range:NSMakeRange(0, fullString.length)];
    return (fullString.length == 0) ?: (matches == 1);
}

#pragma mark - Notifications handlers
#pragma mark - Gestures handlers
#pragma mark - KVO
#pragma mark - NSCopying
#pragma mark - NSObject

@end
