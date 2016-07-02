//
//  EVAFormViewController.m
//  lesson40
//
//  Created by Evgeniy Akhmerov on 02/07/16.
//  Copyright © 2016 Evgeniy Akhmerov. All rights reserved.
//

#import "EVAFormViewController.h"

@interface EVAFormViewController ()

@property (nonatomic, strong) UITapGestureRecognizer *tapAnywhere;

@end

@implementation EVAFormViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tapAnywhere = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapAnywhere:)];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.view addGestureRecognizer:self.tapAnywhere];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [self.view removeGestureRecognizer:self.tapAnywhere];
}

#pragma mark - Custom Accessors
#pragma mark - Actions
#pragma mark - Public
#pragma mark - Private
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
