//
//  EVAFormViewController.m
//  lesson40
//
//  Created by Evgeniy Akhmerov on 02/07/16.
//  Copyright © 2016 Evgeniy Akhmerov. All rights reserved.
//

#import "EVAFormViewController.h"
#import "EVAStudent.h"

@interface EVAFormViewController ()

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
    
    self.tapAnywhere = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapAnywhere:)];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.view addGestureRecognizer:self.tapAnywhere];
    
    if (self.controllerModel) {
        [self configureByModel];
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [self.view removeGestureRecognizer:self.tapAnywhere];
}

#pragma mark - Custom Accessors
#pragma mark - Actions
#pragma mark - Public

#pragma mark - Private

- (void)configureByModel {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.firstNameField.text = self.controllerModel.firstName;
        self.lastNameField.text = self.controllerModel.lastName;
        [self.dateOfBirthField setCurrentDate:self.controllerModel.dateOfBirth];
        self.genderControl.selectedSegmentIndex = self.controllerModel.gender;
        [self.gradeField setGradeValue:self.controllerModel.grade];
    });
}
#pragma mark - Segue
#pragma mark - Animations
#pragma mark - Protocol conformance
#pragma mark - Notifications handlers

#pragma mark - Gestures handlers

- (void)handleTapAnywhere:(UITapGestureRecognizer *)gesture {
    [self.view endEditing:YES];
}

#pragma mark - KVO
#pragma mark - NSCopying
#pragma mark - NSObject

@end
