//
//  EVAPatient.m
//  lesson9
//
//  Created by Eugeny on 21/07/15.
//  Copyright (c) 2015 Eugeny Akhmerov. All rights reserved.
//

#import "EVAPatient.h"

@implementation EVAPatient

#pragma mark - Life cycle

#pragma mark - Custom Accessors

- (void)setDoctorScore:(NSInteger)aScore {
  _doctorScore = (aScore >= 0 && aScore < 11) ? aScore : 0;
}

#pragma mark - Actions
#pragma mark - Public
#pragma mark - Private
#pragma mark Segue
#pragma mark Animations

#pragma mark - Protocol conformance
#pragma mark EVADoctorDelegate

- (void)patientFeelsBad:(id<EVADoctorDelegate>)aPatient {
  
}

- (void)doctor:(EVADoctor *)aDoctor treatmentDidRecommended:(NSDictionary *)userInfo {
  
}

#pragma mark - Notifications handlers
#pragma mark - Gestures handlers
#pragma mark - KVO
#pragma mark - NSCopying
#pragma mark - NSObject

@end
