//
//  EVAFormViewController.m
//  lesson40
//
//  Created by Evgeniy Akhmerov on 02/07/16.
//  Copyright © 2016 Evgeniy Akhmerov. All rights reserved.
//

#import "EVAFormViewController.h"
#import "EVANumberField.h"
#import "EVABirthdayField.h"
#import "EVAStudent.h"

@interface EVAFormViewController () <UITextFieldDelegate>

@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *fieldsChain;
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet EVABirthdayField *dateOfBirthField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderControl;
@property (weak, nonatomic) IBOutlet EVANumberField *gradeField;

@property (nonatomic, strong) UITapGestureRecognizer *tapAnywhere;

@end

@implementation EVAFormViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSTimeInterval adultAge = ((21 * 365) + (20 / 4)) * (24 * 60 * 60);
    self.controllerModel = [EVAStudent createStudentFirstName:@"Uasya"
                                                     lastName:@"Pupkin"
                                                  dateOfBirth:[NSDate dateWithTimeInterval:-adultAge sinceDate:[NSDate date]]
                                                       gender:EVAGenderMale
                                                        grade:3.2];
    [self.controllerModel registerObserver:self];
    
    self.tapAnywhere = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapAnywhere:)];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.view addGestureRecognizer:self.tapAnywhere];
    
    if (self.controllerModel) {
        [self configureByModel];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSTimeInterval adultAge = ((40 * 365) + (20 / 4)) * (24 * 60 * 60);
        self.controllerModel = [EVAStudent createStudentFirstName:@"Ira"
                                                         lastName:@"Sidorova"
                                                      dateOfBirth:[NSDate dateWithTimeInterval:-adultAge sinceDate:[NSDate date]]
                                                           gender:EVAGenderFemale
                                                            grade:4.1];
    });
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [self.view removeGestureRecognizer:self.tapAnywhere];
}

#pragma mark - Custom Accessors

- (void)setControllerModel:(EVAStudent *)controllerModel {
    _controllerModel = controllerModel;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self configureByModel];
    });
}

#pragma mark - Actions

- (IBAction)onFieldValueChanged:(UITextField *)sender {
    if ([sender isEqual:self.firstNameField]) {
        self.controllerModel.firstName = self.firstNameField.text;
    } else if ([sender isEqual:self.lastNameField]) {
        self.controllerModel.lastName = self.lastNameField.text;
    } else if ([sender isEqual:self.dateOfBirthField]) {
        self.controllerModel.dateOfBirth = [self.dateOfBirthField currentDate];
    } else if ([sender isEqual:self.gradeField]) {
        self.controllerModel.grade = [self.gradeField gradeValue];
    }
    NSLog(@"%@", [self.controllerModel debugDescription]);
}

- (IBAction)onSegmentChanged:(UISegmentedControl *)sender {
    self.controllerModel.gender = sender.selectedSegmentIndex;
    NSLog(@"%@", [self.controllerModel debugDescription]);
}

- (IBAction)onClean:(id)sender {
    [self.controllerModel clean];
    [self configureByModel];
}

#pragma mark - Public

#pragma mark - Private

- (void)configureByModel {
    if (!self.isViewLoaded) {
        return;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.firstNameField.text = self.controllerModel.firstName;
        self.lastNameField.text = self.controllerModel.lastName;
        [self.dateOfBirthField setCurrentDate:self.controllerModel.dateOfBirth];
        self.genderControl.selectedSegmentIndex = self.controllerModel.gender;
        [self.gradeField setGradeValue:self.controllerModel.grade];
    });
}

- (void)passToNextResponder:(UIResponder *)sender {
    NSUInteger index = [self.fieldsChain indexOfObject:sender];
    
    if (index + 1 == self.fieldsChain.count) {
        [self.fieldsChain[index] resignFirstResponder];
    } else {
        UIResponder *next = self.fieldsChain[index + 1];
        if ([next canBecomeFirstResponder]) {
            [next becomeFirstResponder];
        }
    }
}

- (NSString *)kindByIndex:(NSInteger)index {
    static NSArray *kinds = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        kinds = @[ @"NSKeyValueChangeSetting",
                   @"NSKeyValueChangeInsertion",
                   @"NSKeyValueChangeRemoval",
                   @"NSKeyValueChangeReplacement" ];
    });
    
    return (index > 0 && (index + 2) < (NSInteger)kinds.count ) ? kinds[index - 1] : @"unspecified";
}

#pragma mark - Segue
#pragma mark - Animations

#pragma mark - Protocol conformance
#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return (CGFLOAT_IS_DOUBLE) ? DBL_EPSILON : FLT_EPSILON;
}

#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self passToNextResponder:textField];
    return NO;
}

#pragma mark - Notifications handlers

#pragma mark - Gestures handlers

- (void)handleTapAnywhere:(UITapGestureRecognizer *)gesture {
    [self.view endEditing:YES];
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if (context != EVAStudentContext) {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    } else {
        
        
        NSInteger kind = [change[@"kind"] integerValue];
        id newValue = change[@"new"];
        id oldValue = change[@"old"];
        NSNumber *prior = change[@"notificationIsPrior"];
        
        NSLog(@"****************************************");
        NSLog(@"%@ (%@)", [object description], keyPath);
        NSLog(@"kind %@", [self kindByIndex:kind]);
        
        if (newValue) {
            NSLog(@"new: %@", [newValue description]);
        }
        
        if (oldValue) {
            NSLog(@"old: %@", [oldValue description]);
        }
        
        if (prior) {
            NSLog(@"%@ prior", [prior boolValue] ? @"is" : @"is not");
        }
        
        NSLog(@"****************************************\n\n");
    }
}

#pragma mark - NSCopying
#pragma mark - NSObject

@end
